{pkgs, ... }:

{
  home.packages = with pkgs; [ neofetch fet-sh pfetch ];
  home.file.".config/neofetch/config.conf".source = ./config.conf;
}
