{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.programs.mpv;
in
{
  options.n.programs.mpv = with types; {
    enable = mkBoolOpt true "Whether or not to enable mpv.";
  };

  config =
    mkIf cfg.enable { 
      n.home.extraOptions = {
        programs.mpv = {
          enable = true;

          scripts = with pkgs.mpvScripts; [
            thumbnail
            youtube-quality
            mpv-playlistmanager
            
          ];
        };
      };
}