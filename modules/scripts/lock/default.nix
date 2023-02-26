{options, config, lib,  pkgs, ... }:

with lib;
let
  lock = pkgs.writeShellScriptBin "lock" ''
  swaylock --color 000000 --show-failed-attempts -l --font Iosevka Nerd Font --text-color ffccff --ring-color ffccff --ring-wrong-color ffccff -n --inside-color 000000 --inside-wrong-color 000000 --inside-ver-color 000000 --ring-ver-color 000000 --indicator-idle-visible --separator-color 000000
  '';

 cfg = config.n.scripts.lock;
in
{
 options.n.scripts.lock = {
  enable = mkBoolOpt true "Whether to enable lock script";
 };

  config = mkIf cfg.enable  {  

  environment.systemPackages = [ 
    lock
     ];
  };
}
