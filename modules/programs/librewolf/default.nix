{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.programs.librewolf;
in
{
  options.n.programs.librewolf = with types; {
    enable = mkBoolOpt true "Whether or not to enable librewolf.";
  };

  config = mkIf cfg.enable { 
    environment.systemPackages = with pkgs; [ librewolf ];
     };
   } 