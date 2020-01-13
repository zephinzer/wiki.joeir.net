# Software Engineering / Ubuntu

- [Software Engineering / Ubuntu](#software-engineering--ubuntu)
  - [Creating a Live USB Stick](#creating-a-live-usb-stick)
  - [Common commands you'll run](#common-commands-youll-run)
  - [Common stuff to install](#common-stuff-to-install)
    - [Basic Tools](#basic-tools)
      - [Spotify](#spotify)
        - [Via Snap](#via-snap)
        - [Via PPA](#via-ppa)
      - [Telegram](#telegram)
    - [Development Tools](#development-tools)
      - [AWS CLI](#aws-cli)
      - [Golang](#golang)
      - [Kubectl](#kubectl)
      - [Node Version Manager (NVM)](#node-version-manager-nvm)
      - [Postman](#postman)
      - [VSCodium](#vscodium)
      - [Yarn](#yarn)
    - [Sysadmin/Security/Network Tools](#sysadminsecuritynetwork-tools)
      - [NMap](#nmap)
      - [Sysdig](#sysdig)

## Creating a Live USB Stick

Get the Ubuntu ISO image from:

[https://ubuntu.com/download/desktop](https://ubuntu.com/download/desktop)

Plug in a USB stick and run the following to get the mount path:

```sh
df
```

Unmount it using (replace `/dev/sdb1` with the appropriate output from the above `df` command):

```sh
sudo umount /dev/sdb1
```

Run the following to create the live USB (replace `ubuntu-19.04-desktop-amd64.iso` with your image's path, and replace `/dev/sdb1` with the appropriate output from the above `df` command):

```sh
# for ubuntu 18.04
sudo dd bs=4M if=~/Downloads/ubuntu-18.04.3-desktop-amd64.iso of=/dev/sdb1 status=progress oflag=sync;

# for ubuntu 19.04
sudo dd bs=4M if=~/Downloads/ubuntu-19.04-desktop-amd64.iso of=/dev/sdb1 status=progress oflag=sync;
```

## Common commands you'll run

```sh
# list all local repositories (ppas)
sudo apt policy;

# update existing repository (ppa) metadata
sudo apt-get update;

# installing new software
sudo apt-get install ...;

# removing existing software
sudo apt-get uninstall ...;

# remove existing software and all files
sudo apt-get purge ...;
```

## Common stuff to install

### Basic Tools

#### Spotify

##### Via Snap

!!! Warn
    Spotify exists as a Snap package but if you have a VPN, Spotify will fail to connect

```sh
sudo snap install spotify
```

##### Via PPA

```sh
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4773BD5E130D1D45;
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list;
sudo apt-get update;
sudo apt-get install spotify-client;
```

#### Telegram

```sh
sudo snap install telegram-desktop
```

### Development Tools

If you're doing development work, the following sets up a nice base environment:

```sh
sudo apt-get update;

# common tools installation
sudo apt-get install curl git jq vim python-pip;

# run following and set to vim
sudo update-alternatives --config editor;
```

#### AWS CLI

```sh
sudo apt-get install awscli;
```

#### Golang

```sh
sudo add-apt-repository ppa:longsleep/golang-backports;
sudo apt-get update;
sudo apt-get install golang-go;
```

#### Kubectl

```sh
sudo apt-get update && sudo apt-get install -y apt-transport-https;
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -;
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list;
sudo apt-get update;
sudo apt-get install -y kubectl;
```

#### Node Version Manager (NVM)

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash;
nvm install lts/argon;
nvm install lts/boron;
nvm install lts/carbon;
nvm install lts/dubnium;
nvm install lts/erbium;
```

#### Postman

```sh
sudo snap install postman;
```

#### VSCodium

VSCodium is VSCode without Micro$oft's analytics.

```sh
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -;
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list;
sudo apt-get update;
sudo apt-get install codium;

# reference: https://vscodium.com/
```

#### Yarn

```sh
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -;
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list;
sudo apt-get update;
sudo apt-get install yarn;
```

### Sysadmin/Security/Network Tools

The following sets up essential

```sh
sudo apt-get update;
sudo apt-get install iperf net-tools openssl traceroute;
```

#### NMap

```sh
sudo apt-get update;
sudo apt-get install nmap;
```

#### Sysdig

```sh
curl -s https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public | sudo apt-key add -;
sudo curl -s -o /etc/apt/sources.list.d/draios.list https://s3.amazonaws.com/download.draios.com/stable/deb/draios.list  
sudo apt-get update;
sudo apt-get install sysdig;
```
