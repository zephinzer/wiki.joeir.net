> Software Engineering / Databases

# MySQL

MySQL is a relational database management system (RDBMS) owned by Oracle.

- [MySQL](#mysql)
- [Running Locally](#running-locally)
  - [Docker Setup](#docker-setup)
  - [Docker-Compose Setup](#docker-compose-setup)

- - -

# Running Locally

## Docker Setup

The following commnad creates a standalone MySQL database instance that:

1. Is accessible on port `3306` from your host
2. Has persistent data on host
3. Is not running as `root`

```sh
mkdir -p ./data/mysql;
docker run -it \
  --env MYSQL_ROOT_PASSWORD=toor \
  --env MYSQL_USER=username \
  --env MYSQL_PASSWORD=password \
  --env MYSQL_DATABASE=database \
  --publish 3306:3306 \
  --user $(id -u) \
  --volume $(pwd)/data/mysql:/var/lib/mysql \
  --name usvc_mysql \
  mysql:5.7;
```

To connect to it, use:

```sh
# from host
mysql -uroot -ptoor -h127.0.0.1 database;

# from guest
docker exec -it usvc_mysql mysql -uroot -ptoor -h127.0.0.1 database;
```

## Docker-Compose Setup

The following creates a MySQL database instance inside a Docker-Compose setup:

```yaml
version: "3.5"
services:
  mysql:
    image: mysql:5.7
    container_name: usvc_mysql
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
      MYSQL_DATABASE: default
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    ports:
      - target: 3306
        published: 3306
        protocol: tcp
        mode: host
    user: "${USER_ID:-root}"
    volumes:
      - "${DATA_ROOT:-.}/data/mysql/data:/var/lib/mysql"
```

To start it, use:

```sh
USER_ID=$(id -u) DATA_ROOT=$(pwd) docker-compose -f ./docker-compose.yaml up;
```

To connect to it, use:

```sh
# from host
mysql -uroot -ptoor -h127.0.0.1 database;
```
