
{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.cli.misc;
in
{
  options.n.cli.misc = with types; {
    enable = mkBoolOpt true "Whether or not to enable extra packages";
  };

  config =
    mkIf cfg.enable { 
      n.home.extraOptions = {
        home.packages = with pkgs; [ 
          gallery-dl
          
     ];
   };
  };
}