{ pkgs ? import <nixpkgs> {} }:

# Add more packages to this shell.
# https://search.nixos.org/packages

with pkgs;
mkShell {
  nativeBuildInputs = [
    nodejs
    nodePackages.vue-cli
  ];
  shellHook = ''
    if ! command -v nuxt &> /dev/null
    then
        echo "nuxt not found, installing..."
        npm install nuxt
    fi

    if ! command -v vite &> /dev/null
    then
        echo "vite not found, installing..."
        npm install create-vite
    fi

    if ! command -v tailwindcss &> /dev/null
    then
        echo "tailwindcss not found, installing..."
        npm install tailwindcss
    fi
  '';
}
