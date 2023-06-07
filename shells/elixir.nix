{ pkgs ? import <nixpkgs> {} }:

# Add more packages to this shell.
# https://search.nixos.org/packages

with pkgs;
mkShell {
  nativeBuildInputs = [
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
}
