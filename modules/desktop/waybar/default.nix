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
                background-color: rgba(12, 12, 12, 0.0);
                color: rgb(255, 255, 255);
              }

            window#waybar {
                 background-color: transparent;
                 background: rgba(12, 12, 12, 0.0);
               }
               window > box {
                 margin-left: 5px;
                 margin-right: 5px;
                 margin-top: 2px;
               }
            
            #workspaces {
                 padding-left: 0px;
                 padding-right: 4px;
               }
            #memory, #battery, #clock, #window {
              padding-left: 15px;
              padding-right: 15px;
            }

      '';
      settings = [{
        "layer" = "top";
        "position" = "top";
        "spacing" = 10; 
        modules-left = [
           "wlr/workspaces" 
                 ];
        modules-center = [
            "hyprland/window"
        ];

        modules-right = [
          "memory"
          "clock"
          "battery"
        ]; 

        "wlr/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
         };
        "hyprland/window" = {
          "format" = "{}";
          "seperate-outputs" = "true";
          "max-length" = "20";
          
        };
        "battery" = {
          "interval" = 10;
          "states" = {
            "warning" = 20;
            "critical" = 10;
          };
          "format" = "{icon} {capacity}%";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
          "format-full" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          };
        "memory" = {
          "interval" = 1;
          "format" = "﬙ {percentage}%";
          "states" = {
            "warning" = 70;
            };
          };
        "clock" = {
          "interval" = 1;
          "format" = "{:%I:%M %p  %A %b %d}";
        };
      }];
    };
    };
  };
}
