{
  description = "devShell outputs for `ldv` 
  and maybe additional tools in the future";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
    (system:
    let
      pkgs = import nixpkgs { inherit system; };

    in with pkgs;
    {
      devShells.haskell = callPackage ./shells/haskell.nix { };
      devShells.web = callPackage ./shells/web.nix { };
      devShells.elixir = callPackage ./shells/elixir.nix { };
  });
}
