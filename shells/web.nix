{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {
  nativeBuildInputs = [
    nodejs
    purescript
    spago
    nodePackages.vue-cli
  ];
}
