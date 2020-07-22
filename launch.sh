#! /usr/bin/env nix-shell
#! nix-shell -i bash --packages nodejs-10_x nix
#! nix-shell -I nixpkgs=channel:nixos-19.09

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

node $(nix-build -I nixpkgs=channel:nixos-19.09 $DIR/override.nix -A package)/lib/node_modules/piechart/index.js "$@"
