#!/bin/bash
#
# Example usage
# NAME="foo" DIR="../../" ./create.sh
#
# set +e is to ignore error
# Disable exit on non 0. Mostly to allow the delete if a directory exist.
# Has rm -rf in the script which i dont' like.
set +e
cd build
docker-compose up
mv ${NAME} ${DIR}
cp ../app/docker-compose.yml ${DIR}/${NAME}
rm -rf ${NAME}
cd ..