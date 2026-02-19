#!/bin/bash

if [[ "$GIT_CACHE_DIR" == "" ]] ; then
  echo "Set GIT_CACHE_DIR to point to cache directory"
  exit 1
fi

if [[ ! -d "$GIT_CACHE_DIR" ]]; then
  echo "GIT_CACHE_DIR=$GIT_CACHE_DIR doesn't exist!"
  exit 1
fi

cd $GIT_CACHE_DIR

for i in * ; do ( cd $i; git fetch ; ) done 

