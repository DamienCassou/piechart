#! /usr/bin/env nix-shell
#! nix-shell -i bash --packages nodejs-10_x nix
#! nix-shell -I nixpkgs=channel:nixos-19.09

node $(nix-build -I nixpkgs=channel:nixos-19.09 override.nix -A package)/lib/node_modules/piechart/index.js "$@"
