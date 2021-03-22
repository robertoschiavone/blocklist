# Torrent Blocklist

[![Blocklist](https://github.com/robertoschiavone/blocklist/actions/workflows/main.yml/badge.svg)](https://github.com/robertoschiavone/blocklist/actions/workflows/main.yml)

This repository contains only one GitHub Action that pulls and merges together lists from [I-Blocklist](https://www.iblocklist.com/). The list excludes IANA reserved addresses, unallocated addresses and Tor IPs, and it's refreshed daily.

The generated file is in [P2P plaintext format](https://en.wikipedia.org/wiki/PeerGuardian#P2P_plaintext_format) and the latest version can always be found [here](https://raw.githubusercontent.com/robertoschiavone/blocklist/master/blocklist.p2p).

Inspired by the previous works of [@johntyree](https://gist.github.com/johntyree/3331662) and [@jyio](https://github.com/sahsu/transmission-blocklist/issues/1#issuecomment-636341434). 
