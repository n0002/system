{options, config, pkgs, lib, ... }:

with lib;
let
  cfg = config.n.desktop.waybar;
in
{
 options.n.desktop.waybar = with types; {
    enable = mkBoolOpt true "Whether or not to enable waybar.";
  };

  config = mkIf cfg.enable {
  n.home.extraOptions = {
  programs.waybar = {
      enable = true;
      style = ''
              * {
                font-family: "Iosevka Nerd Font";
                font-size: 16pt;
                font-weight: bold;
                border-radius: 0px;
                background-color: rgb(0, 0, 0); 
                color: rgb(255, 255, 255);
              }
            #workspaces {
                background-color: rgb(0, 0, 0); 
                }
      '';
      settings = [{
        "layer" = "top";
        "position" = "top";
        "spacing" = 10; 
        modules-left = [
        ];
        modules-center = [
          "wlr/workspaces"
          "battery"
        ];
        modules-right = [
          "memory"
        ]; 
        "wlr/workspaces" = {
          "format" = "{icon}";
        };
        
        "battery" = {
          };
        "memory" = {
          };

      }];
    };
    };
  };
}
