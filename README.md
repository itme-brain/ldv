# Lazy dev
**Disclaimer: This is a hobby project and mainly just a repo of setups I like to use.**

`ldv` is a bash script utility for creating preconfigured developer environments powered by Nix. 

It automates the setup of development environments for various programming languages and frameworks.

> Note: This is actively under development, and I plan to add support for more languages, frameworks, and options in the future.

## Requirements

This tool relies on the following software:

- [Nix](https://nixos.org/download.html) > *flakes and nix-commands enabled*
- [nix-direnv](https://github.com/nix-community/nix-direnv)

Please ensure these are installed on your system before proceeding with the installation.

## Installation

### Via Makefile

Included is a simple `Makefile` with this project, which you can use to install `ldv` by running the following command in your terminal:

```bash
sudo make install
```
This will copy the `ldv` script to `/usr/local/bin` which ideally is in your `$PATH`.

### Manual Installation

Alternatively, you can install `ldv` manually by copying it to a location in your `$PATH` or by copy the contents of the `ldv` script to your `.bashrc` and wrapping it in a `funtion(){}`

### Usage

To start a new environment, enter the following command in your terminal:

`ldv`

To initialize a new dev template in the current directory, use the `init` option:

`ldv init`

Dev templates are simply a `flake.nix` + `.envrc` that enables you to enter an isolated and reproducible build environment whenever you enter your projects directory.

### Contributing

Contributions and feedback are appreciated! Whether you have feature requests, bug reports, or code changes
