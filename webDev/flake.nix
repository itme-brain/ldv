{
  description = "A simple NodeJS web development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShell.${system} = pkgs.mkShell {
        buildInputs = with pkgs; [
          nodejs
          purescript
          spago
          nodePackages.parcel
        ];
      };
    };
}
