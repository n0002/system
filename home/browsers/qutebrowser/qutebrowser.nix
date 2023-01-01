{pkgs, lib, ... }:

{
  home.packages = with pkgs; [ qutebrowser-qt6 haskellPackages.bisc ];
  home.file.".config/qutebrowser/config.py".source = ./config.py;

  
  nixpkgs.overlays = [
    (final: prev: { qutebrowser = prev.qutebrowser.override { enableWideVine = true; }; })
  ];

}
