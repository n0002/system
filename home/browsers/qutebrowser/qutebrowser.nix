{pkgs, lib, ... }:

{
  home.packages = with pkgs; [ qutebrowser widevine-cdm haskellPackages.bisc ];
  home.file.".config/qutebrowser/config.py".source = ./config.py;
}
