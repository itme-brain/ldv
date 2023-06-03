#!/bin/bash

if [[ $1 == "--init" ]]; then
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
      cp "$SCRIPT_DIR/flakes/elixir/flake.nix" .
      echo "use flake" >> .envrc && direnv allow
      ;;
    3)
      wget -q https://raw.githubusercontent.com/itme-brain/lazydev/main/flakes/haskell/flake.nix
      cp "$SCRIPT_DIR/flakes/haskell/flake.nix" .
      echo "use flake" >> .envrc && direnv allow
      ;;
    # Add more cases here...
    *)
      echo "Invalid choice"
      ;;
  esac
else
  echo "Select an environment:"
  echo "1. Web"
  echo "2. Elixir"
  echo "3. Haskell"
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
      echo "Invalid choice"
      ;;
  esac
fi
