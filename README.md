<div align=center >
    <h1 style="font-size: 48px; font-weight: bold; color:rgb(112, 34, 111)">Simple ZRAM</h1>
    <p style="font-size: 24px; font-weight: bold">
        Turn part of your RAM into a compressed block device for faster swapping
        </p>
</div>

## Introduction

ZRAM is a compressed block device that uses part of your RAM for a given purpose. Things like tmpfs, logs, and swap can be stored in ZRAM to speed up read/write operations. This is especially useful for systems that run an a slow storage device like an SD card or HDD. For most people, ZRAM is used as a swap device to speed up swapping.

### Features

- Sets storage size using configuration file (default: 2G)
- Automatically enables ZRAM on boot
- Set compression algorithm using configuration file (default: lzo)
- Check if RAM is 32GB or more
- Check if less then 50% of RAM is used

## Installation

Install the package using the following command:

```bash
sudo make install
```

## Configuration

The configuration file is located at `/etc/simple-zram.conf`. The default configuration is as follows: But you can change it according to your needs. Just make sure that size is not set to high or you may run into issues.

```bash
# Set the size of the swap device: Use the suffix K for KiB, M for MiB, G for GiB
# default: 2G
SWAP_SIZE="2G"

# Set the compression algorithm to use for the swap device
# Possible values: lzo, lz4, lz4hc, deflate, 842, zstd
# default: lzo
COMPRESSION="lzo"
```

Restart the service for the changes to take effect:

```bash
sudo systemctl restart simple-zram
```

## Uninstallation

To uninstall the package, run the following command:

```bash
sudo make uninstall
```
