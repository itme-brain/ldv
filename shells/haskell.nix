{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {
  nativeBuildInputs = [
    ghc
    cabal-install
    cabal2nix
    stack
    haskellPackages.hoogle
    haskellPackages.doctest
  ];
}
