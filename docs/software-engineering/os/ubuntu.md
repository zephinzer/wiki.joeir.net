# Software Engineering / Ubuntu

- [Software Engineering / Ubuntu](#software-engineering--ubuntu)
- [Creating a Live USB Stick](#creating-a-live-usb-stick)

# Creating a Live USB Stick

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
