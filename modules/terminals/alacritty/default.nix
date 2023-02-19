{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.terminals.alacritty;
in
{
  options.n.terminals.alacritty = with types; {
    enable = mkBoolOpt true "Whether or not to enable alacritty.";
  };

  config = mkIf cfg.enable {
    n.home.extraOptions = {
      programs.alacritty = {
        enable = true;
      };
    };
  };
} 