{options, config, lib,  pkgs, ... }:

let
  lock = pkgs.writeShellScriptBin "lock" ''
  swaylock --color 000000 --show-failed-attempts -l --font Iosevka Nerd Font --text-color ffccff --ring-color ffccff --ring-wrong-color ffccff -n --inside-color 000000 --inside-wrong-color 000000 --inside-ver-color 000000 --ring-ver-color 000000 --indicator-idle-visible --separator-color 000000
  '';
in
{
  home.packages = [ 
  lock
   ];
}
