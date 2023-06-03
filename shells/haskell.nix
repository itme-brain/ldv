{ pkgs ? import <nixpkgs> {} }:

with pkgs;
mkShell {
  nativeBuildInputs = [
    ghc
    cabal-install
    cabal2nix
    haskellPackages.hlint
    haskellPackages.hoogle
    haskellPackages.doctest
  ];
}
