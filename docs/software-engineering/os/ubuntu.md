# Software Engineering / Ubuntu

- [Software Engineering / Ubuntu](#software-engineering--ubuntu)
  - [Creating a Live USB Stick](#creating-a-live-usb-stick)
  - [Common commands you'll run](#common-commands-youll-run)

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
