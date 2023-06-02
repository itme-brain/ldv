{
  description = "Haskell Development Environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.default = pkgs.mkShell {
        buildNativeInputs = with pkgs; [
          ghc
          cabal-install
          cabal2nix
          stack
          haskellPackages.hoogle
          haskellPackages.doctest
        ];
      };
    });
}
