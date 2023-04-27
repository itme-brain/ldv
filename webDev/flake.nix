{
  description = "Web Development Flake";
  
  #TODO: Add more shells, name them each by environment e.g. reactShell 

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.11";
  };

  # Run nix develop --flake '.#<SHELL>' to enter a dev shell
  outputs = { self, nixpkgs }: {
    
    devShell.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux; 
      mkShell {
        buildInputs = [
          nodejs
          yarn
        ];
      };
  };
}

