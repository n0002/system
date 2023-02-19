{ options, config, lib, pkgs, hyprland, ... }: 

with lib; 

let
  cfg = config.n.desktop.hyprland;
in

{
  options.n.desktop.hyprland = with types; {
  enable =  mkBoolOpt true "Whether or not to enable hyprland"; 
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      };

      environment.systemPackages = with pkgs; [
        wayland
        xwayland
        wayland-protocols
        wayland-utils
        glfw-wayland
        wlr-randr
        qt6.qtwayland
        wdisplays
        swayidle
        wayland-scanner
      ];
    };
  }

