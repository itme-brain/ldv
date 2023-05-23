{
  description = "A development environment for Elixir and Phoenix";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      elixir = pkgs.elixir_1_14;
      nodejs = pkgs.nodejs-19_x;
    in
    {
      devShell.${system} = pkgs.mkShell {
        buildInputs = with pkgs; [
          elixir
          nodejs
          postgresql_12
        ];
  
        shellHook = ''
          if ! mix local.hex --help > /dev/null 2>&1; then
            mix local.hex
          fi

          if ! mix local.rebar --help > /dev/null 2>&1; then
            mix local.rebar
          fi

          if ! mix archive | grep phx_new > /dev/null 2>&1; then
            mix archive.install hex phx_new
          fi
        '';
      };
    };
}
