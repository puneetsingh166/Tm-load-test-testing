#!/bin/bash
set -eux

# this directy of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOCKERFOLDER=$DIR/dockerfile
REPOFOLDER=$DIR/../..

# change our directory sot hat the git arcive command works as expected
pushd $REPOFOLDER

#docker system prune -a -f
# Build base container
git archive --format=tar.gz -o $DOCKERFOLDER/onomy.tar.gz --prefix=onomy/ HEAD
pushd $DOCKERFOLDER
cd ../../
docker build --pull -f tests/tm-load-test/dockerfile/Dockerfile  -t cosmosbase .