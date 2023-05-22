{
  description = "Web Development Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.11";
  };

  outputs = { self, nixpkgs }: {
    
    devShell.x86_64-linux = with nixpkgs.legacyPackages.x86_64-linux; 
      mkShell {
        buildInputs = [
          nodejs
          python3
        ];
      };
  };
}

