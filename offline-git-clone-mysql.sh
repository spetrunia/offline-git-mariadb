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

if [[ "${1-}" == --branch=* ]]; then
    branch="${1#--branch=}"
    shift
fi

if [ -z "$1" ]; then
  usage_and_exit
fi

if [ -z "$2" ]; then
  SRC_TREE=$GIT_CACHE_DIR/mysql-server
  DST_TREE=$1
else
  SRC_TREE=$1
  DST_TREE=$2
fi

if [ -z "$branch" ]; then
  git clone $SRC_TREE $DST_TREE
else
  git clone --branch $branch $SRC_TREE $DST_TREE
fi
echo "Done!"

