{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.programs.firefox;
in
{
  options.n.programs.firefox = with types; {
    enable = mkBoolOpt true "Whether or not to enable firefox.";
  };

  config = mkIf cfg.enable { 
    environment.systemPackages = with pkgs; [ firefox ];
     };
   } 