#!/usr/bin/env bash

dirs=(
  express-graphql-server
  graphql-apollo-express-server
  graphql-apollo-server
  graphql-yoga-server
)

npmPkgs=(
  typesync
  npm-check-updates
)

for pkg in "${npmPkgs[@]}"; do
  if which ${pkg} >/dev/null; then
    echo "Package ${pkg} is already installed"
    true
  else
    echo "Installing ${pkg}..."
    npm install -g "${pkg}"
  fi
done

for dir in "${dirs[@]}"; do
  echo "Updating $dir"
  cd $dir
  typesync
  ncu -u
  yarn
  cd ..
done