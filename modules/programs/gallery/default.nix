
{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.programs.gallery-dl;
in
{
  options.n.programs.gallery-dl = with types; {
    enable = mkBoolOpt true "Whether or not to enable gallery-dl.";
  };

  config =
    mkIf cfg.enable { 
      n.home.extraOptions = {
        programs.gallery-dl = {
          enable = true;
  };
}