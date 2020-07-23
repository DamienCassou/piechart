{ pkgs ? import
  (fetchTarball "http://nixos.org/channels/nixos-19.09/nixexprs.tar.xz") {
    inherit system;
  }, system ? builtins.currentSystem }:

let
  node = pkgs."nodejs-10_x";
  node2nixSetup = import ./node2nix/override.nix { inherit pkgs; };
  pieChartModule = node2nixSetup.package;
in pkgs.writeShellScriptBin "piechart" ''
  ${node}/bin/node ${pieChartModule}/lib/node_modules/piechart/index.js "$@"
''
