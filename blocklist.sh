#!/bin/bash -l

# Unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

FILE=blocklist.p2p
TEMP_FILE="${FILE}.tmp"

# Cleanup
trap 'rm -f ${TEMP_FILE}' EXIT

curl -s --fail https://www.iblocklist.com/lists.json \
    | jq -r '.lists[] | .name as $n | select((.subscription == "false") and
        ($n | startswith("iana-") | not) and (["fornonlancomputers", "bogon",
        "The Onion Router"] | index($n) | not)) | .list'  \
    | awk 'length($0) > 2 {
        print "https://list.iblocklist.com/?fileformat=p2p&archiveformat=gz&list=" $0
    }' \
    | xargs wget --quiet -O - \
    | gunzip \
    | grep -Ev '^#' > "${FILE}"

# Remove first line and ensure trailing newline
tail -n +2 "${FILE}" > "${TEMP_FILE}" && mv "${TEMP_FILE}" "${FILE}"
