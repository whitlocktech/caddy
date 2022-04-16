FROM caddy:2.5.0-rc.1-builder-alpine AS builder

run xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/hslatman/caddy-crowdsec-bouncer

FROM caddy:2.5.0-rc.1-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
