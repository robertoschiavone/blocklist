FROM alpine:latest@sha256:124c7d2707904eea7431fffe91522a01e5a861a624ee31d03372cc1d138a3126

LABEL org.opencontainers.image.title="Blocklist"
LABEL org.opencontainers.image.description="A Docker image to build a blocklist in P2P plaintext format"
LABEL org.opencontainers.image.authors="Roberto Schiavone <robertoschiavone@users.noreply.github.com>"
LABEL org.opencontainers.image.url="https://github.com/robertoschiavone/blocklist"
LABEL org.opencontainers.image.created="2023-04-2T15:00:00+02:00"
LABEL org.opencontainers.image.documentation="https://github.com/robertoschiavone/blocklist"
LABEL org.opencontainers.image.source="https://github.com/robertoschiavone/blocklist"
LABEL org.opencontainers.image.version="0.1.0"
LABEL org.opencontainers.image.base.name="alpine:latest"
LABEL org.opencontainers.image.base.digest="sha256:124c7d2707904eea7431fffe91522a01e5a861a624ee31d03372cc1d138a3126"

COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache curl
RUN apk add --no-cache jq

ENTRYPOINT ["/entrypoint.sh"]

