# Docker 快速上手

---

开始
`sh start -d`

删除
`sh stop`

---

停止容器
`# docker stop $(docker ps -a | grep "Exited" | awk '{print $1 }')`

删除容器
`# docker rm $(docker ps -a | grep "Exited" | awk '{print $1 }') `
或
`# docker rm -v $(docker ps -aq -f status=exited)`

删除镜像
`# docker rmi $(docker images | grep "none" | awk '{print $3}')`



# 停止所有容器
docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker stop

# 删除所有容器
docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker rm

# 删除所有none镜像
docker images|grep none|awk '{print $3 }'|xargs docker rmi

先查询依赖

`docker image inspect --format='{{.RepoTags}} {{.Id}} {{.Parent}}' $(docker image ls -q --filter since=XXX) # XXX指镜像ID`

然后根据根据TAG删除容器

docker rm REPOSITORY:TAG


# Docker 常用命令

## Docker run

`docker run` Run a command in a new container 

Example: 

`docker run --rm -it php:7.1-fpm-alpine3.7 php -v` 

`--rm` remove container once finish 

`--it` interactive mode and tty

`php:7.1-fpm-alpine3.7` image name

`php -v` command need to run or `docker-entry-point`

## Docker start

`docker start [container-name]` to starts one or more stopped containers

## Docker stop

`docker stop container-name` Stops one or more running containers

## Docker remove

`docker rm -fv container-name` Remove exisiting containers 

`-f` force to stop before removing

`-v` remove container's volumns if exist

## Docker exec

`docker exec -it container-name command` Execute command inside container

## Docker process list

`docker ps [-a]` display all containers

`-a` display all containers including stopped containers

## Docker logs 

`docker logs [-f] container-name` Display stdout / stderr of container

`-f` follow output of container 

## Other commands

`docker build [-t tag-name] context` Build docker image 

`docker pull image-name:tag`Pull docker images

`docker push` to push docker built image to docker registry

# Boilerplate

`./start` to up project
`.env` contains all variables can be used in `docker-compose.yml`

`./stop` to stop project and remove all built images 

After run `./start`, it’s able to display all containers of that project
`docker ps |grep project-name`

Run a command inside dockers
`docker exec -it [container-name] [command]`
[command] = `sh` or `bash` to enter interactive mode sh / bash of container
Example:
`docker exec -it node-container sh`
`docker exec -it php-fpm-container sh`


If you want to run command directly from host console, you can able to run like
`docker exec -it node-container npm install`
`docker exec -it php-fpm-container php -v`
`docker exec -it php-fpm-conatiner /data/wwww/artisan db:seed`

### File and folder permission

In some cases, running user may has the uid different between host and container so when container write to file system, these files / folders's permission may cause to the host machine can not open them. 
Example:

- Default user of node container is `node`
- Default user of php fpm: master is `root`, and `worker` is www-data
- Most of others, user is `root`

To fix that: update `Dockerfile` user to be `1000` as `1000` is the first user id for almost linux distro.

In Host machine, run `sudo chown your-user-name -Rf /path/to/project` to fix folders / files permission. 

Or in services on `docker-compose.ym` set `use` to be `${DOCKER_HOST_UID}` which `DOCKER_HOST_UID=($id)`

## Tips

`./docker-compose build service-name` to rebuild 1 service only

`./docker-compose build --no-cache service-name` to rebuild 1 service only with no cache

`./docker-compose up -d --force-recreate` recreate container after build service success

`./docker-compose up -d --remove-orphans` to remove orphans containers 

`./docker-compose logs -f` display docker container output with following mode

`./docker-compose logs -f service-name` to display output of certain container

`./docker-compose exec service-name command` exec command inside container

`./docker-compose restart` to restart all project docker container

`./docker-compose restart service-name` to restart certain container

#### Getting problem about code does not refresh after edited 

1. No need to run `./stop`
2. Stop current `./start` process if it's running as foreground
3. Run `./docker-compose build service-name` to rebuild service
4. Run `./start --force-recreate` again or run `./docker-compose up --force-recreate`


停止容器
# docker stop $(docker ps -a | grep "Exited" | awk '{print $1 }')
删除容器

# docker rm $(docker ps -a | grep "Exited" | awk '{print $1 }') 

或

# docker rm -v $(docker ps -aq -f status=exited)

删除镜像

# docker rmi $(docker images | grep "none" | awk '{print $3}')
