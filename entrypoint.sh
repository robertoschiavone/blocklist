#!/bin/sh -l

FILE=blocklist.p2p

curl -s https://www.iblocklist.com/lists.json \
	| jq -r '.lists[] | .name as $n | select((.subscription == "false") and
		($n | startswith("iana-") | not) and (["fornonlancomputers", "bogon",
		"The Onion Router"] | index($n) | not)) | .list'  \
	| awk '{ 
			if (length($0) > 2)
				print "https://list.iblocklist.com/?fileformat=p2p&archiveformat=gz" \
					"&list=" $0
		}' \
	| xargs wget -O - \
	| gunzip \
  | grep -Ev '^#' > "${FILE}"

tail -n +2 "${FILE}" > "${FILE}.tmp" && mv "${FILE}.tmp" "${FILE}"
echo "" >> "${FILE}"

