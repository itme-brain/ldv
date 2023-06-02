# Lazy dev
**Disclaimer: This is a hobby project in its early stages.**

`ldv` is a simple utility for creating preconfigured developer environments powered by Nix. It automates the setup of development environments for various programming languages and frameworks.

> Note: This project is actively under development, and we plan to add support for more languages, frameworks, and options in the future.

## Requirements

This tool relies on the following software:

- [Nix](https://nixos.org/download.html)
- [nix-direnv](https://github.com/nix-community/nix-direnv)

Please ensure these are installed on your system before proceeding with the installation.

## Installation

### Via Makefile

We've included a `Makefile` with this project, which you can use to install `ldv` by running the following command in your terminal:

```bash
sudo make install
```
This will copy the `ldv` script to `/usr/local/bin` which ideally is in your `$PATH`.

### Manual Installation

Alternatively, you can install `ldv` manually by copying it to a location in your `$PATH` or by copy the contents of the `ldv` script to your `.bashrc` and wrapping it in a `funtion(){}`

### Usage

To start a new environment, simply enter the following command in your terminal:

`ldv`

To initialize a new dev template in the current directory, use the `init` option:

`ldv init`

### Contributing

We welcome and appreciate contributions to the project! Whether you have feature requests, bug reports, or code changes
