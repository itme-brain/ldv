#!/bin/bash

function ldv() {

if [[ $1 == "help" ]] || [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
  cat << EOF
lazy dev
A simple utility for setting up development environments effortlessly.
Commands:
  ldv               Start a preconfigured nix shell.
  init              Create a new dev template in the current working directory.
  help              Show available commands and options.

Contributions welcome: https://github.com/itme-brain/lazydev
EOF

elif [[ $1 == "init" ]] || [[ $1 == "-i" ]] || [[ $1 == "--init" ]]; then
  if [[ -e ./shell.nix ]] || [[ -e ./.envrc ]]; then
    cat << EOF
Existing environment found.
Initialization cancelled.
EOF
    return
  fi
  
  cat << EOF
Initializing a new environment...
Select an environment:
1. Web
2. Elixir
3. Haskell
EOF
  # Add more options here...

  read -p "Enter the number of your choice: " choice

  case $choice in
    1)
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/shells/web.nix -O shell.nix
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/ex/flake -O flake.nix
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/ex/envrc -O .envrc
      ;;
    2)
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/shells/elixir.nix -O shell.nix
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/ex/flake -O flake.nix
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/ex/envrc -O .envrc
      ;;
    3)
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/shells/haskell.nix -O shell.nix
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/ex/flake -O flake.nix
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/ex/envrc -O .envrc
      ;;
    # Add more cases here...
    *)
      echo "Invalid choice."
      ;;
  esac
elif [[ -z $1 ]]; then
  cat << EOF
Select an environment:
1. Web
2. Elixir
3. Haskell
EOF
  # Add more options here...

  read -p "Enter the number of your choice: " choice

  case $choice in
    1)
      (nix develop github:itme-brain/lazydev#web)
      ;;
    2)
      (nix develop github:itme-brain/lazydev#elixir)
      ;;
    3)
      (nix develop github:itme-brain/lazydev#haskell)
      ;;
    # Add more cases here...
    *)
      echo "Invalid choice."
      ;;
  esac
else
  echo "Error: Invalid command. Try 'ldv --help'"
fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  ldv "$@"
fi
