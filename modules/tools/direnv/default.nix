{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.tools.direnv;
in
{
  options.n.tools.direnv= with types; {
    enable = mkBoolOpt false "Whether or not to enable direnv.";
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