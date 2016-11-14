# プロジェクトのはじめ方

## コードディレクリを初期化する

coposer dockerイメージを使って、wwwディレクリを初期化します。

```
docker run --rm -v $(pwd):/app composer/composer create-project laravel/laravel www
```

書き込み権限を付与します。

```
chmod -R 777 www/storage/
chmod -R 777 www/bootstrap/cache/
````




# docker runする場合

## docker build

Dockerfileから、dockerイメージをビルドします。

```
docker build -t laravel .
```

## docker run

docker runコマンドで、起動します。

```
docker run -p 8080:80 -w /var/www/public -d -v ./www:/var/www -name webapp laravel
```


# docker-composeする場合

## docker-compose.yml

```
version: '2'
services:
  php-laravel:
    build: admin
    ports:
      - 8082:80
    volumes:
      - ./admin/www:/var/www
    environment:
      DB_CONNECTION: mysql
      DB_HOST: db
      DB_DATABASE: laravel
      DB_USERNAME: laravel
      DB_PASSWORD: laravel
    working_dir: /var/www/public
  db:
    image: mariadb:10.0.24
    user: root
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: hogehoge
      MYSQL_DATABASE: laravel
      MYSQL_USER: laravel
      MYSQL_PASSWORD: laravel
    volumes:
      - mariadb_data:/var/lib/mysql
    ports:
      - 3306:3306

volumes:
  mariadb_data:
    external: true

```


## docker-compose build

```
docker-compse build
```

## docker-compose up -d

```
docker-compose up -d
```



## DBをマイグレートします

webappという名前で起動したコンテナで、マイグレートを実行します。

```
docker exec -it webapp php artisan migrate
```
