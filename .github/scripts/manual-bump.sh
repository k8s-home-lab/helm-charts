#!/usr/bin/env bash
set -eu

# Absolute path of repository
repository=$(git rev-parse --show-toplevel)

for parent_dir in $(ls ${repository}/charts/stable/)
do

  version=$(grep "^version:" ${repository}/charts/**/${parent_dir}/Chart.yaml | awk '{print $2}')
  if [[ ! $version ]]; then
    echo "No valid version was found"
    exit 1
  fi

  major=$(echo "$version" | cut -d. -f1)
  minor=$(echo "$version" | cut -d. -f2)
  patch=$(echo "$version" | cut -d. -f3)

  minor=$(( minor + 1 ))
  patch=0

  echo "Bumping version for $parent_dir from $version to $major.$minor.$patch"
  sed -i "s/^version:.*/version: ${major}.${minor}.${patch}/g" ${repository}/charts/**/${parent_dir}/Chart.yaml

done
