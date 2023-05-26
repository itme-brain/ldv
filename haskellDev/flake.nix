{
  description = "A development environment for Haskell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      ghc = pkgs.haskell.compiler.ghcHEAD;
    in
    {
      devShell.${system} = pkgs.mkShell {
        buildInputs = with pkgs; [
          ghc
          cabal-install
          cabal2nix
        ];
    };
  };
}
