{ pkgs ? import <nixpkgs> {} }:

# Add more packages to this shell.
# https://search.nixos.org/packages

with pkgs;
mkShell {
  nativeBuildInputs = [
    python3Full
    poetry
    python311Packages.flask
    python311Packages.toolz
  ];
}
