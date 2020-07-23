{pkgs}:
let
  nodePackages = import ./default.nix {inherit pkgs;};
in
nodePackages // {
  package = nodePackages.package.override {
    buildInputs = with pkgs; [ pkgconfig cairo ];
  };
  shell = nodePackages.shell.override {
    buildInputs = with pkgs; [ pkgconfig cairo ];
  };
}
