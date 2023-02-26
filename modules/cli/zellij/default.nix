{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.cli.zellij;
in
{
  options.n.cli.zellij = with types; {
    enable = mkBoolOpt true "Whether or not to enable zellij.";
  };

  config = mkIf cfg.enable { 
      n.home.extraOptions = {
        programs.zellij = {
          enable = true;
      };
 
  home.file.".config/zellij/config.kdl".source = ./config.kdl;
  home.file.".config/zellij/layouts/main.kdl".source = ./layouts/main.kdl;
  # home.file.".config/zellij/config.kdl".source = ./config.kdl;

    };
  };
}
