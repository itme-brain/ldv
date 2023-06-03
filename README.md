# ldv
**Disclaimer: This is a hobby devops project and mainly just a repo of setups I like to use.**

`ldv` is a simple bash script utility for creating preconfigured developer environments powered by Nix. 

It automates the setup of development environments for various programming languages and frameworks.

> Note: This is actively under development, and I plan to add support for more languages, frameworks, and options in the future.

## Requirements

This tool relies on:

- [Nix](https://nixos.org/download.html)
- [direnv](https://direnv.net/docs/installation.html) or [nix-direnv](https://github.com/nix-community/nix-direnv)

Please ensure `nix` is installed on your system before proceeding with the installation.

## Installation

```bash
sh <(curl -sSL https://raw.githubusercontent.com/itme-brain/ldv/main/utils/install)
```

If you currently do not have nix installed, you will be prompted to install it
via the official installation method - https://nixos.org/download.html

### Manual Installation

Alternatively, you can install `ldv` manually by copying `ldv.sh` to a location in your `$PATH` or by sourcing it in your `.bashrc`

### Usage

To start a new environment with some sensible defaults, enter the following command in your terminal:

`ldv`

To initialize a new dev template in the current directory, use the `init` option:

`ldv init`

Dev templates are a `flake.nix` + `.envrc` that enables you to automagically enter an isolated and reproducible build environment whenever you enter your projects directory.

### Contributing

Contributions and feedback are appreciated! Whether you have feature requests, bug reports, or code changes
