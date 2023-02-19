{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.programs.tmux;
in
{
  options.n.programs.tmux = with types; {
    enable = mkBoolOpt true "Whether or not to enable tmux.";
  };

  config = mkIf cfg.enable { 
    n.home.extraOptions = {
      programs.tmux = {
        enable = true;
      };
    };
}