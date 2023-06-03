{
  description = "A development environment for Elixir and Phoenix";

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
          elixir
          nodejs
          postgresql
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
    });
}
