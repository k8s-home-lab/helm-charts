#!/usr/bin/env bash
set -eu

parent_dir="$1"
update_type="$2"
docker_image="$3"
docker_version="$4"

# Absolute path of repository
repository=$(git rev-parse --show-toplevel)

version=$(grep "^version:" ${repository}/charts/**/${parent_dir}/Chart.yaml | awk '{print $2}')
if [[ ! $version ]]; then
  echo "No valid version was found"
  exit 1
fi

major=$(echo "$version" | cut -d. -f1)
minor=$(echo "$version" | cut -d. -f2)
patch=$(echo "$version" | cut -d. -f3)

if [[ "$update_type" =~ (major|replacement) ]]; then
  major=$(( major + 1 ))
  minor=0
  patch=0
elif [[ "$update_type" =~ 'minor' ]]; then
  minor=$(( minor + 1 ))
  patch=0
else
  patch=$(( patch + 1 ))
fi

echo "Bumping version for $parent_dir from $version to $major.$minor.$patch"
sed -i "s/^version:.*/version: ${major}.${minor}.${patch}/g" ${repository}/charts/**/${parent_dir}/Chart.yaml

echo "Updating artifacthub.io/changes"
sed -i "s/^    - kind:.*/    - kind: changed/g" ${repository}/charts/**/${parent_dir}/Chart.yaml
sed -i "s%^      description:.*%      description: ${update_type} update ${docker_image} to ${docker_version}%g" ${repository}/charts/**/${parent_dir}/Chart.yaml
