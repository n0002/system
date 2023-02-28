{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.shell.nix;
in
{
  options.n.shell.nix = with types; {
    enable = mkBoolOpt true "Whether or not to enable direnv.";
  };

  config = mkIf cfg.enable {
    n.home.extraOptions = {
      programs.direnv = {
        enable = true;
        nix-direnv = enabled;
      };
    };
  };
}