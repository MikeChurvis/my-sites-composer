#!/usr/bin/bash

exit-with-message() {
  echo "[ERROR:deploy.bash] $1"
  exit 1
}

SITE_NAME="mikechurvis.com"
SITE_REPO="git@github.com:MikeChurvis/my-sites-laravel.git"
CURRENT_DATETIME=$(date +"%Y%m%d%H%M%S%N")
RELEASE_DIR="/srv/__releases/$SITE_NAME/$CURRENT_DATETIME"

mkdir --parents "$RELEASE_DIR"

cd "$RELEASE_DIR" || {
  exit-with-message "Can't cd into $RELEASE_DIR. Check that it exists, and that permissions are correctly set."
}

if [[ -n $(ls -h) ]]
then
  exit-with-message "Cannot clone into a non-empty directory. Aborting."
fi

git clone "$SITE_REPO" .

# TODO laravel stuff

# TODO symlink stuff

# TODO nginx stuff

# TODO fallback to previous release, if one exists