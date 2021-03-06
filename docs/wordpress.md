> Software Engineering / CMS

# WordPress

WordPress is a blogging platform.

# Running Locally

## Using Docker-Compose

```yaml
version: "3.5"
services:
  wordpress:
    image: wordpress:5.3-php7.2-apache
    container_name: usvc_wordpress
    deploy:
      resources:
        limits:
          cpus: '0.3'
          memory: 64Mi
        reservations:
          cpus: '0.15'
          memory: 64Mi
    environment:
      WORDPRESS_DB_HOST: mysql
      WORDPRESS_DB_USER: user
      WORDPRESS_DB_PASSWORD: password
      WORDPRESS_DB_NAME: database
    ports:
      - target: 80
        published: 8000
        protocol: tcp
        mode: host
    volumes:
      - "${DATA_ROOT:-.}/data/wordpress:/var/www/html"
  mysql:
    image: mysql:5.7
    container_name: usvc_wordpress_mysql
    deploy:
      resources:
        limits:
          cpus: '0.4'
          memory: 64Mi
        reservations:
          cpus: '0.2'
          memory: 32Mi
    command:
      - "mysqld"
      - "--sql-mode=STRICT_ALL_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION,NO_AUTO_VALUE_ON_ZERO"
      - "--init-connect=SET collation_connection = utf8mb4_unicode_ci"
      - "--max-allowed-packet=8M"
      - "--innodb-ft-min-token-size=2"
      - "--character-set-server=utf8mb4"
      - "--collation-server=utf8mb4_unicode_ci"
      - "--event-scheduler=ON"
      - "--default-time-zone=+00:00"
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: database
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    user: "${USER_ID:-root}"
    volumes:
      - "${DATA_ROOT:-.}/data/mysql/data:/var/lib/mysql"
```
