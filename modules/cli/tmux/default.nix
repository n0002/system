{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.cli.tmux;
in
{
  options.n.cli.tmux = with types; {
    enable = mkBoolOpt true "Whether or not to enable tmux.";
  };

  config = mkIf cfg.enable { 
    n.home.extraOptions = {
      programs.tmux = {
        enable = true;
      };
    };
};
}