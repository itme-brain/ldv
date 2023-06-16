{ pkgs ? import <nixpkgs> {} }:

# Add more packages to this shell.
# https://search.nixos.org/packages

with pkgs;
mkShell {
  nativeBuildInputs = [
    nodejs
    purescript
    spago
    nodePackages.purs-tidy
    haskellPackages.zephyr
  ];
}
