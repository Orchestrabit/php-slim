# プロジェクトのはじめ方

PHP slimフレームワークを開発するDocker環境のテンプレートです。

http://www.slimframework.com/


## コードディレクリを初期化する

coposer dockerイメージを使って、wwwディレクリを初期化します。

```
docker run --rm -v $(pwd):/app composer/composer create-project slim/slim-skeleton www
```

# docker runする場合

## docker build

Dockerfileから、dockerイメージをビルドします。

```
docker build -t php-slim .
```

## docker run

docker runコマンドで、起動します。

```
docker run -p 8080:80 -w /var/www/public -d -v ./www:/var/www -name webapp php-slim
```


# docker-composeする場合

## docker-compose.yml

```
version: '2'
services:
  php-slim:
    build: php-slim
    ports:
      - 8080:80
    volumes:
      - ./admin/www:/var/www
    working_dir: /var/www/public
```


## docker-compose build

```
docker-compse build
```

## docker-compose up -d

```
docker-compose up -d
```
