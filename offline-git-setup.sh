#!/bin/bash

if [[ "$GIT_CACHE_DIR" == "" ]] ; then
  echo "Set GIT_CACHE_DIR to point to cache directory"
  exit 1
fi

mkdir -p $GIT_CACHE_DIR

if [[ ! -d "$GIT_CACHE_DIR" ]]; then
  echo "GIT_CACHE_DIR=$GIT_CACHE_DIR doesn't exist!"
  exit 1
fi

cd $GIT_CACHE_DIR

git clone https://github.com/MariaDB/server.git
git clone https://github.com/mariadb-corporation/libmarias3.git
git clone https://github.com/mariadb-corporation/mariadb-columnstore-engine.git
git clone https://github.com/MariaDB/mariadb-connector-c.git
git clone https://github.com/mariadb-corporation/mariadb-connector-c.wiki.git
git clone https://github.com/facebook/rocksdb.git
git clone https://github.com/wolfSSL/wolfssl.git
git clone https://github.com/codership/wsrep-API.git
git clone https://github.com/codership/wsrep-lib.git
git clone https://github.com/mysql/mysql-server.git

