{ pkgs ? import
  (fetchTarball "http://nixos.org/channels/nixos-19.09/nixexprs.tar.xz") {
    inherit system;
  }, system ? builtins.currentSystem }:

let
  node2nixSetup = (import ./node2nix/override.nix { inherit pkgs; });
in node2nixSetup.shell
