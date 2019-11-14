# ada-docker

### About
Ada Discovery Analytics supports manual and Docker installation. 
Manual installation is recommended in environments where full control over every
stack component, such as Elasticsearch, MongoDB, Spark, and Ada itself is required. 
Docker however, is much easier to set up and provides a highly reproducible 
environment. Consequently, Docker is recommended in most cases. 

Please note: Partial usage is also possible. For example, it is perfectly acceptable 
to use your own Spark or DB cluster, but use Docker for everything else.

### Requirements

* docker
* docker-compose
* git
* at least 8GB Memory on the docker host

### Installation
We assume that git, Docker and Docker-Compose are already installed on the system and 
are up-to-date. It is possible to check this by opening a terminal and running 
the following commands: 
```
> docker --version
Docker version 19.03.1, build 74b1e89

> docker-compose --version
docker-compose version 1.24.1, build 4667896b

> git --version
git version 2.23.0
```
If these commands fail or if the versions are much older than the one displayed 
above please consult https://docs.docker.com/install/ and https://docs.docker.com/compose/install/

If docker and git are working correctly, please run the following commands:
```
> git clone https://github.com/ada-discovery/ada-docker.git
> cd ada-docker
> docker-compose up
```
The last command might require root access to connect with the Docker engine. 
Depending on your network connection, this step will take a few minutes. Once 
all the services are up and running you can open Chrome or Firefox and 
navigate to `http://localhost:8080` or, if you use Docker Toolbox, to http://<`docker-machine ip`>:8080 
(usually something like 192.168.99.100). 

### Configuration
#### DO NOT MODIFY ANY FILES IN THIS PROJECT MANUALLY
All supported settings are exposed via environment variables. For example, if you
want to provide your own `custom.conf` with your own logos and LDAP settings you
must set ADA_CONF on the docker host to this file like this: 
```
export ADA_CONF=/path/to/custom.conf
```
For the full list of currently supported settable environment variables please 
refer to the `.env` file in this project.