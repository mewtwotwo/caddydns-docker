FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/alidns

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN mkdir -p /etc/caddy && \
    echo '{ \
      "apps": { \
        "http": { \
          "http_port": 1080, \
          "https_port": 1443 \
        } \
      } \
    }' > /etc/caddy/global.json
