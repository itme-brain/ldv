{
  description = "A development environment for Haskell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
  inputs.usnixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, usnixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      upkgs = import usnixpkgs { inherit system; };
      ghc = upkgs.haskell.compiler.ghc96;
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          ghc
          cabal-install
          cabal2nix
        ];
    };
  };
}
