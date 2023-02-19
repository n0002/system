{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.programs.rofi;
in
{
  options.n.programs.rofi = with types; {
    enable = mkBoolOpt true "Whether or not to enable rofi.";
  };

  config = mkIf cfg.enable { 
    environment.systemPackages = [pkgs.rofi-wayland];
}