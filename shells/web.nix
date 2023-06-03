{ pkgs ? import <nixpkgs> {} }:

# Add more packages to this environment.
# https://search.nixos.org/packages

with pkgs;
mkShell {
  nativeBuildInputs = [
    nodejs
    purescript
    spago
    nodePackages.vue-cli
  ];
}
