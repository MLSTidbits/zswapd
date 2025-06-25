<div align="right">
  <img
    src="images/logo.png"
    alt="Zswapd logo"
    width="auto"
    height="360"
  />
</div>

## Introduction

**Zswapd** is bash script that creates a compressed block device in RAM to be used as a swap space. It is designed to be simple and easy to use. While there are many other tools that can do this, however **Zswapd** is meant to be more intuitive and user-friendly.

## Features

- Create a compressed block device in RAM
- Automatically detects if less than recommended amount of RAM is available.
- Automatically detects if ZRAM is already enabled.
- Automatically detects if enough free RAM is available.

## Installation

There are a few ways to install **Zswapd**: the recommended way is to use the the [Repository](https://repository.howtonebie.com/) and follow the instructions there. Alternatively, you can clone the repository and run the script manually.

### Manual Installation

```console
git clone https://github.com/MichaelSchaecher/Zswapd.git
cd Zswapd
```

Copy the scripts to root directory:

```console
sudo cp -av Zswapd /usr/bin/
sudo cp -av Zswapd.conf /etc/
sudo cp -av Zswapd.service /usr/lib/systemd/system/
sudo cp -av zram.conf /etc/modprobe.d/Zswapd.conf
```

To transpile the manpage file, you need to have `pandoc` installed. If you don't have it, you can install it using your package manager. For example, on Debian-based systems, you can run:

```console
sudo apt update ; sudo apt install pandoc
pandoc -s -t man man/Zswapd.8.md -o /usr/share/man/man8/Zswapd.8
```

To enable the service, run: `sudo systemctl enable --now Zswapd.service`

### Downloading the DEB Package

You can download the [latest](https://github.com/MichaelSchaecher/Zswapd/releases) DEB package and use `dpkg` to install it:

```console
sudo dpkg -i Zswapd_*.deb
```

Or a GUI package manager like `gdebi` or `Qapt` to install it.
