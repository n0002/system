{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.programs.anki;
in
{
  options.n.programs.anki = with types; {
    enable = mkBoolOpt true "Whether or not to enable anki.";
  };

  config = mkIf cfg.enable { 
    environment.systemPackages = with pkgs; [ anki-bin ];
     };
   } 