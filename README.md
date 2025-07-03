<div align="right">
  <img
    src="images/logo.png"
    alt="Zswapd logo"
    width="auto"
    height="360"
  />
</div>

<div align="center"><h2 style="font-size: 36px; font-weight: bold;">Introduction</h2></div>

**Zswapd** is bash script that creates a compressed block device in RAM to be used as a swap space. It is designed to be simple and easy to use. While there are many other tools that can do this, however **Zswapd** is meant to be more intuitive and user-friendly.

Who is zswapd for? It is for anyone who wants to use a compressed block device in RAM as a swap space and have more then 32GB of RAM and use less then 50% at most. It is not meant to be used on systems with less than 32GB of RAM, as it will not work properly and may cause issues.

<div align="left"><h3 style="font-size: 24px; font-weight: bold;">Features</h3></div>

- Create a compressed block device in RAM
- Automatically detects if less than recommended amount of RAM is available.
- Automatically detects if ZRAM is already enabled.
- Automatically detects if enough free RAM is available.

<div align="center"><h2 style="font-size: 36px; font-weight: bold;">Installation</h2></div>

There are a few ways to install **Zswapd**: the recommended way is to use the the [Repository](https://repository.howtonebie.com/) and follow the instructions there. Alternatively, you can clone the repository and run the script manually.

<div align="left"><h3 style="font-size: 24px; font-weight: bold;">Manual Installation</h2></div>

Installing on none Debian-based systems is easy. Just clone the repository and run the script.

```console
git clone https://github.com/MichaelSchaecher/Zswapd.git
cd Zswapd
```

Then you can run the script directly:

```console
sudo ./configure --install
```

<div align="left"><h3 style="font-size: 24px; font-weight: bold;"Manually Build and Install</h2></div>

To build the package manually, you need to install the required dependencies. This means that the [HowToNebie](https://repository.howtonebie.com/) repository is required. To find out what dependencies are required, you can run the following command: the output will show you the required dependencies.

```console
./configure --init
```

Assuming you have the required dependencies installed, and the changelog was generated/updated, you can build the package with the following command:

```console
dpkg-buildpackage --build=binary  --sign-keyid=GPG-Key-ID --root-command=fakeroot
```

<div align="center"><h2 style="font-size: 36px; font-weight: bold;">Contributing</h2></div>

If you want to contribute to **Zswapd**, you can do so by opening an issue or a pull request on the [GitHub repository](https://github/com/MichaelSchaecher/Zswapd). You can also contribute by reporting bugs, suggesting features, or improving the documentation.
