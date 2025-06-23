<div align="right">
  <img
    src="images/logo.svg"
    alt="zswapd logo"
    width="auto"
    height="360"
  />
</div>

## Introduction

**ZSwapD** is bash script that creates a compressed block device in RAM to be used as a swap space. It is designed to be simple and easy to use. While there are many other tools that can do this, however **ZSwapD** is meant to be more intuitive and user-friendly.

## Features

- Create a compressed block device in RAM
- Automatically detects if less than recommended amount of RAM is available.
- Automatically detects if ZRAM is already enabled.
- Automatically detects if enough free RAM is available.

## Installation

There are a few ways to install **ZSwapD**: the recommended way is to use the the [Repository](https://repository.howtonebie.com/) and follow the instructions there. Alternatively, you can clone the repository and run the script manually.

### Manual Installation

```console
git clone https://github.com/MichaelSchaecher/zswapd.git
cd zswapd
```

Copy the scripts to root directory:

```console
sudo cp -av zswapd /usr/bin/
sudo cp -av zswapd.conf /etc/
sudo cp -av zswapd.service /usr/lib/systemd/system/
sudo cp -av zram.conf /etc/modprobe.d/zswapd.conf
```

To transpile the manpage file, you need to have `pandoc` installed. If you don't have it, you can install it using your package manager. For example, on Debian-based systems, you can run:

```console
sudo apt update ; sudo apt install pandoc
pandoc -s -t man man/zswapd.8.md -o /usr/share/man/man8/zswapd.8
```

To enable the service, run: `sudo systemctl enable --now zswapd.service`

### Downloading the DEB Package

You can download the [latest](https://github.com/MichaelSchaecher/zswapd/releases) DEB package and use `dpkg` to install it:

```console
sudo dpkg -i zswapd_*.deb
```

Or a GUI package manager like `gdebi` or `Qapt` to install it.
