# Docker

- [Docker](#docker)
  - [Installation](#installation)
    - [Ubuntu](#ubuntu)
  - [Notes](#notes)
    - [Logging into a Docker Registry](#logging-into-a-docker-registry)
    - [Logging into ECR Docker Registry](#logging-into-ecr-docker-registry)



## Installation

### Ubuntu

!!! Info
    The following instructions was successful for Ubuntu 18.04.3 in December 2019

```sh
# update metadata of ppas
sudo apt-get update;

# install system dependencies
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    uidmap;

# add docker's gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;~~~~

# verify gpg key is there
sudo apt-key fingerprint 0EBFCD88;

# add docker's ppa
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable";

# update metadata of ppas again
sudo apt-get update;

# install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io;
```

If the above fails, it's probably outdated and you can find the updated version at [https://docs.docker.com/install/linux/docker-ce/ubuntu/](https://docs.docker.com/install/linux/docker-ce/ubuntu/).

It's also highly recommended to run Docker as a non-root user:

```sh
# -- obviously do not run any of the following as root --
# install docker as rootless
curl -fsSL https://get.docker.com/rootless | sh;

# set your paths (add to your .profile or .bashrc etc)
export PATH=$PATH:/home/$(whoami)/bin:/sbin;
export DOCKER_ROOT=unix:///run/user/$(id -u)/docker.sock;
# the following solves the "Error response from daemon: experimental session with v1 builder is no longer supported, use builder version v2 (BuildKit) instead" issue
export DOCKER_BUILDKIT=1;

# test the docker daemon
docker version;

# if not started, use following to start it
systemctl --user start docker;

# once started, to persist it, use:
sudo loginctl enable-linger $(whoami);
```

If the above instructions fail, the latest is available at [https://docs.docker.com/engine/security/rootless/](https://docs.docker.com/engine/security/rootless/).



## Notes

### Logging into a Docker Registry

```sh
docker login docker.io -u username -p password
```

### Logging into ECR Docker Registry

```sh
aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.ap-southeast-1.amazonaws.com
```
