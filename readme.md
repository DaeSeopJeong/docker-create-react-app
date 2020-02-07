# DockerReactBootStrap.

A simple docker-compose builder for the create-react-app that contains a docker-compose file.
Mostly some ops practice but it might be useful to some. 

## TL:DR

1. Go to build directory.
2. Run the following command.
3. NAME - The directory create-react-app creates
4. DIR - The directory to move the starter project.

```
NAME="foo" DIR="../../" ./create.sh
```

At this point whatever directory you asked for should have a simple create-react-app with a docker-compose.yml file.

You can cd into that directory and run.
```
docker-compose up
```

If you don't want to do that and have node install, you can do the usual.
```
npm install && npm start
```



## What thes script does.

1. Creates a docker container.
2. Runs 'npx create-react-app ${NAME} in the container'
3. Moves the output of the create-react-app to ${DIR}
4. Copies a generic `docker-compose.yml` file to ${DIR}/${NAME} 

At this point, you should be able to `docker-compose up` the react project.
No node install required.

## Notes

### Node version.

This project was creates on 08/27/2019
Node 10 was the LTS as of this creation.
You should generally use the LTS version unless you really need to be on the bleeding edge.
Change as needed.
Note. There are two docker files.

### 1000:1000 in docker compose

Docker in ubuntu creates files as the root user.
This will change it so it creates it for the logged in user.

https://dev.to/acro5piano/specifying-user-and-group-in-docker-i2e
This is the issue

