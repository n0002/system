{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.terminals.wezterm;
in
{
  options.n.terminals.wezterm = with types; {
    enable = mkBoolOpt false "Whether or not to enable wezterm.";
  };

  config = mkIf cfg.enable {
    n.home.extraOptions = {
      programs.wezterm = {
      enable = true;
      };
    };
  };
}
