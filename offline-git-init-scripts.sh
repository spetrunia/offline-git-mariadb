#!/bin/bash

# Need this: git config --global protocol.file.allow always

if [[ ! -e "./offline-git-init-scripts.sh" ]]; then
  echo "Run this from offline-git-mariadb repository"
  exit 1
fi

rm ~/bin/offline-git-clone-mariadb.sh
rm ~/bin/offline-git-clone-mysql.sh
rm ~/bin/offline-git-setup.sh
rm ~/bin/offline-git-update.sh
 
ln -s `pwd`/offline-git-clone-mariadb.sh ~/bin/offline-git-clone-mariadb.sh
ln -s `pwd`/offline-git-clone-mysql.sh ~/bin/offline-git-clone-mysql.sh
ln -s `pwd`/offline-git-setup.sh ~/bin/offline-git-setup.sh
ln -s `pwd`/offline-git-update.sh ~/bin/offline-git-update.sh
