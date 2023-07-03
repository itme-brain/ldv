#!/bin/bash

function ldv() {

	if [[ $1 == "help" ]] || [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
		cat <<EOF
ldv
A simple utility for setting up development environments effortlessly.
Commands:
  ldv               Start a preconfigured nix shell.
  init              Create a new dev template in the current working directory.
  help              Show available commands and options.

Contributions welcome: https://github.com/itme-brain/ldv
EOF

	elif [[ $1 == "init" ]] || [[ $1 == "-i" ]] || [[ $1 == "--init" ]]; then
		if [[ -e ./shell.nix ]] || [[ -e ./.envrc ]]; then
			cat <<EOF
Existing environment found.
Initialization cancelled.
EOF
			return
		fi

		cat <<EOF
Initializing a new environment...
Select an environment:
1. Purescript
2. Elixir
3. Haskell
4. Python
5. VueJS
EOF
		# Add more options here...

		read -p "Enter the number of your choice: " choice

		case $choice in
		1)
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/shells/purs.nix -O shell.nix
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/utils/flake -O flake.nix
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/utils/envrc -O .envrc
			direnv allow
			;;
		2)
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/shells/elixir.nix -O shell.nix
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/utils/flake -O flake.nix
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/utils/envrc -O .envrc
			direnv allow
			;;
		3)
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/shells/haskell.nix -O shell.nix
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/utils/flake -O flake.nix
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/utils/envrc -O .envrc
			direnv allow
			;;
		4)
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/shells/python.nix -O shell.nix
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/utils/flake -O flake.nix
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/utils/envrc -O .envrc
			direnv allow
			;;
		5)
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/shells/vue.nix -O shell.nix
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/utils/flake -O flake.nix
			wget -q https://raw.githubusercontent.com/itme-brain/ldv/main/utils/envrc -O .envrc
			direnv allow
			;;
		# Add more cases here...
		*)
			echo "Invalid choice."
			;;
		esac
	elif [[ -z $1 ]]; then
		cat <<EOF
Select an environment:
1. Purescript
2. Elixir
3. Haskell
4. Python
5. VueJS
EOF
		# Add more options here...

		read -p "Enter the number of your choice: " choice

		case $choice in
		1)
			(nix develop github:itme-brain/ldv#purs)
			;;
		2)
			(nix develop github:itme-brain/ldv#elixir)
			;;
		3)
			(nix develop github:itme-brain/ldv#haskell)
			;;
		4)
			(nix develop github:itme-brain/ldv#python)
			;;
		5)
			(nix develop github:itme-brain/ldv#vue)
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
