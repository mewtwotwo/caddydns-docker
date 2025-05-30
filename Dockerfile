FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/alidns

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT ["caddy"]

CMD ["run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
