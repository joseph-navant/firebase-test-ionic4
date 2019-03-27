#!/bin/sh

if ! [ -z "$(git status -z)" ]; then
  echo "Repository not clean, ensure you have committed all your changes"
  exit 1
fi

BRANCH=$(git branch | grep \* | cut -d ' ' -f2-)

if [ $BRANCH = "master" ]; then
  echo "You sould not deploy in master branch"
else
  # Remove old files
  rm -rf www

  # Build
  if [ "$1" = "--dev" ]; then
    ionic build
  else
    ionic build --prod
  fi

  # Deploy
  if [ $? -eq 0 ]; then
    firebase deploy
  fi

  git add .firebase/hosting.d3d3.cache
  git commit -m "Updating firebase cache file"
fi
