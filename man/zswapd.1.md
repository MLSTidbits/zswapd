---
title: zswapd
section: 1
header: Manual Page
footer: SWAP to ZRAM Device
author: Michael Lee Schaecher <michaelleeschaecher@gmail.com>
version: 1.0
date: 2025-05-26
---

# NAME

zswapd - A simple script to create a ZRAM device and use it as swap space.

# SYNOPSIS

**zswapd** [_OPTIONS_]

# DESCRIPTION

**zswapd** is a script that creates a ZRAM device and uses it as swap space. It is designed to be simple and easy to use, providing a quick way to enable ZRAM without needing to manually configure the system. However, Making changes to the `/etc/zswapd.conf` can be done to customize the behavior of the script.

# OPTIONS

_start_
: Start the ZRAM device and enable it as swap space. This will create a ZRAM device with the size specified in the configuration file and enable it for use as swap.

_stop_
: Stop the ZRAM device and disable it as swap space. This will remove the ZRAM device and free up the memory used for swap.

_status_
: Display information about the current state of the ZRAM device, including its size, usage, and swap status.

_config_
: Open the configuration file in _Nano_ editor for easy editing. This allows you to change the size of the ZRAM device, the compression algorithm, and other parameters.

_help_
: Display help information about the script and its options.

# CONFIGURATION

The script uses a configuration file located at `/etc/zswapd.conf`. This file allows you to customize the size of the ZRAM device and other parameters. The default configuration is as follows:

## SWAP_SIZE

Set the size of the swap device: Use the suffix G for gigabytes.

---

:   Default: 2G

---

:   Example: `SWAP_SIZE=4G`

## SWAP_PRIORITY

Set the priority of the swap device. Higher values indicate higher priority.

---

:   Default: 100

---

:   Example: `SWAP_PRIORITY=100`

## SWAP_ALGORITHM

Set the compression algorithm for the ZRAM device. Common options include `lzo`, `lz4`, and `zstd`.

---

:   Default: `lzo`

---

:   Example: `SWAP_ALGORITHM=lz4`

## SWAP_DEVICES

Set the number of ZRAM devices to create. This allows you to create multiple ZRAM devices for swap.

---

:   Default: 1

---

:   Example: `SWAP_DEVICES=2`

# SEE ALSO

**zramctl(8)**, **swapon(8)**, **swapoff(8)**

# COPYRIGHT

This manual page is part of the zswapd project, which is released under the GPU Public License (GPL) version 3 or later. For more information about the license go to <https://www.gnu.org/licenses/gpl-3.0.html>.

Copyright (C) 2025 Michael Lee Schaecher <michaelleeschaecher@gmail.com>
