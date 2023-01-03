
{ pkgs, ... }:

{
  programs = {
    mpv = {
      enable = true;

      scripts = with pkgs.mpvScripts; [
      thumbnail
      ];
    };
  };
  
  home.file.".config/mpv/mpv.conf".source = ./mpv.conf;
}
