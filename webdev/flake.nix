{
  description = "Simple React Web Development Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.11";
  };

  outputs = { self, nixpkgs }: {
    
    # Run nix develop to enter a dev shell
    devShell.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux; 
      mkShell {
        buildInputs = [
          nodejs
          yarn
        ];
      };
  };
}

