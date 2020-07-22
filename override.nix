let
  pkgs = import <nixpkgs> { };
  nodePackages = import ./default.nix {};
in
nodePackages // {
  package = nodePackages.package.override {
    buildInputs = with pkgs; [ pkgconfig cairo ];
  };
}
