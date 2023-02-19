{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.browsers.librewolf;
in
{
  options.n.browsers.librewolf = with types; {
    enable = mkBoolOpt true "Whether or not to enable librewolf.";
  };

  config = mkIf cfg.enable { 
    environment.systemPackages = with pkgs; [ librewolf ];
     };
   } 