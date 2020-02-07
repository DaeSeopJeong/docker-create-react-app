#!/bin/bash
#
# Example usage
# NAME="foo" DIR="../../" ./create.sh
#
# set +e is to ignore error
# Disable exit on non 0. Mostly to allow the delete if a directory exist.
# Has rm -rf in the script which i dont' like.
set +e

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

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

echo "> Cleaning tmp dir"
rm -rf /tmp/build
rm -rf /tmp/docker-compose.yml

echo "> Copying files over"
cp app/docker-compose.yml /tmp
mkdir -p /tmp/build
cp build/docker-compose.yml /tmp/build
cd /tmp/build
docker-compose up
echo "> BUILD COMPLETE. Moving"
mv /tmp/build/${NAME} ${SCRIPTPATH}/${DIR}
mv /tmp/docker-compose.yml ${SCRIPTPATH}/${DIR}/${NAME}
echo "> Cleaning tmp dir again"
rm -rf /tmp/build
rm -rf /tmp/docker-compose.yml

#ls ${DIR}
#ls ${NAME}
#mv ${NAME} ../${DIR}
#echo "> Copying docker compose file"
#cp ../app/docker-compose.yml ../${DIR}/${NAME}
#rm -rf ${NAME}
#cd ..