{ options, config, lib, pkgs, ...}:

with lib; 
let
  cfg = config.n.desktop.screenshot;
in
{
  
  options.n.desktop.screenshot = with types; {
    enable = mkBoolOpt true "Whether or not to enable screenshot tools.";
  };

  config = mkIf cfg.enable { 
      n.home.extraOptions = {

        home.packages = with pkgs; [ sway-contrib.grimshot grim ];
    
}
