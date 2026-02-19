#!/bin/bash
set -e

if [[ "$GIT_CACHE_DIR" == "" ]] ; then
  echo "Set GIT_CACHE_DIR to point to cache directory"
  exit 1
fi

if [[ ! -d "$GIT_CACHE_DIR" ]]; then
  echo "GIT_CACHE_DIR=$GIT_CACHE_DIR doesn't exist!"
  exit 1
fi

usage_and_exit() {
  echo "Usage: $0 [SRC_TREE] DST_TREE"
  exit 1
}

if [ -z "$1" ]; then
  usage_and_exit
fi

if [ -z "$2" ]; then
  SRC_TREE=$GIT_CACHE_DIR/server
  DST_TREE=$1
else
  SRC_TREE=$1
  DST_TREE=$2
fi

git clone $SRC_TREE $DST_TREE

cd $DST_TREE

git submodule init 

sed -i -e "s,url = https://github.com/wolfSSL/wolfssl.git,url = $GIT_CACHE_DIR/wolfssl," .git/config
sed -i -e "s,url = https://github.com/MariaDB/mariadb-connector-c.git,url = $GIT_CACHE_DIR/mariadb-connector-c," .git/config
sed -i -e "s,url = https://github.com/mariadb-corporation/mariadb-columnstore-engine.git,url = $GIT_CACHE_DIR/mariadb-columnstore-engine," .git/config
sed -i -e "s,url = https://github.com/mariadb-corporation/libmarias3.git,url = $GIT_CACHE_DIR/libmarias3," .git/config
sed -i -e "s,url = https://github.com/facebook/rocksdb.git,url = $GIT_CACHE_DIR/rocksdb," .git/config
sed -i -e "s,url = https://github.com/codership/wsrep-lib.git,url = $GIT_CACHE_DIR/wsrep-lib," .git/config

git submodule update
git submodule foreach "git submodule init"
echo "DONE!"

sed -i -e "s,url = https://github.com/codership/wsrep-API.git,url = $GIT_CACHE_DIR/wsrep-API,"  .git/modules/wsrep-lib/config
sed -i -e "s,url = https://github.com/mariadb-corporation/libmarias3.git,url = $GIT_CACHE_DIR/libmarias3," \
  .git/modules/storage/columnstore/columnstore/config

sed -i -e "s,url = https://github.com/mariadb-corporation/mariadb-connector-c.wiki.git,url = $GIT_CACHE_DIR/mariadb-connector-c.wiki," \
  .git/modules/libmariadb/config

git submodule update --recursive

echo "Done!"

