#!/bin/bash
#
# Example usage
# NAME="foo" DIR="../../" ./create.sh
#
# set +e is to ignore error
# Disable exit on non 0. Mostly to allow the delete if a directory exist.
# Has rm -rf in the script which i dont' like.
set +e

if [[ -z "${NAME}" ]]
then
  echo "NAME env variable not defined. Name is the name of the react project"
  exit 1;
fi

if [[ -z "${DIR}" ]] 
then
  echo "DIR env variable not defined. DIR is the path where you want the project to be."
  exit 1;
fi

cd build
docker-compose up
mv ${NAME} ${DIR}
cp ../app/docker-compose.yml ../${DIR}/${NAME}
rm -rf ${NAME}
cd ..