FROM caddy:latest-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/plugin \
    --with github.com/pteich/caddy-tlsconsul

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
