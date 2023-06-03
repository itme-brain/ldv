#!/bin/bash

if [[ $1 == "help" ]] || [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
  echo "lazy dev"
  echo "A simple utility for setting up development environments effortlessly."
  echo "Commands:"
  echo "  ldv               Start a preconfigured nix shell."
  echo "  init              Create a new dev template in the current working directory."
  echo "  help              Show available commands and options."
  echo ""
  echo "Contributions welcome: https://github.com/itme-brain/lazydev"

elif [[ $1 == "init" ]] || [[ $1 == "-i" ]] || [[ $1 == "--init" ]]; then
  if [[ -e ./flake.nix ]] || [[ -e ./.envrc ]]; then
    echo "Existing environment found."
    echo "Initialization cancelled."
    return
  fi

  echo "Initializing a new environment..."
  echo "Select an environment:"
  echo "1. Web"
  echo "2. Elixir"
  echo "3. Haskell"
  # Add more options here...

  read -p "Enter the number of your choice: " choice

  case $choice in
    1)
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/flakes/web/flake.nix
      echo "use flake" >> .envrc && direnv allow
      ;;
    2)
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/flakes/elixir/flake.nix
      echo "use flake" >> .envrc && direnv allow
      ;;
    3)
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/flakes/haskell/flake.nix
      echo "use flake" >> .envrc && direnv allow
      ;;
    # Add more cases here...
    *)
      echo "Invalid choice."
      ;;
  esac
elif [[ -z $1 ]]; then
  echo "Select an environment:"
  echo "1. Web"
  echo "2. Elixir"
  echo "3. Haskell"
  # Add more options here...

  read -p "Enter the number of your choice: " choice

  case $choice in
    1)
      (nix develop ~/Documents/projects/lazydev#web)
      ;;
    2)
      (nix develop ~/Documents/projects/lazydev#elixir)
      ;;
    3)
      (nix develop ~/Documents/projects/lazydev#haskell)
      ;;
    # Add more cases here...
    *)
      echo "Invalid choice."
      ;;
  esac
else
  echo "Error: Invalid command. Try 'ldv --help'"
fi
