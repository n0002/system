{config, pkgs, lib, ... }:

# This waybar config is from https://github.com/Ruixi-rebirth
# Thank you so much
#TODO: build my own bar

{
  programs.waybar = {
      enable = true;
      style = ''
              * {
                font-family: "Iosevka Nerd Font";
                font-size: 16pt;
                font-weight: bold;
                border-radius: 0px;
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
        
        "wlr/workspaces" = {
          "format" = "{icon}";
        };
        
        "battery" = {
          };
      }];
    };
}
