{ pkgs ? import <nixpkgs> {} }:

# Add more packages to this environment as you need them. 
# https://search.nixos.org/packages

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
