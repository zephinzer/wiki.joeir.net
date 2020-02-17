# Nginx

## Installation

```sh
apk add --no-cache nginx
```

## Recipes

### Static File Server

### Reverse Proxy

The following server block opens a server at port `2222` that does a reverse proxy to a service at `hostname` on port `3333`

```nginx
server {
  listen 2222;
  listen [::]:2222;
  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_pass http://hostname:3333;
  }
}
```