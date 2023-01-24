{ pkgs, config, lib, ... }:

# let 
#   colors = import ../../themes/charm.nix; 
# in
 {
 programs.helix = {
    enable = true;
    
    settings = {
      theme = "mocha";
      editor = {
        line-number = "relative";
        mouse = false;
        bufferline = "multiple";
        shell = ["bash" "-c"];
        };

        keys.normal = {
          S = ":w"; # save file
          Q = ":q"; # quit helix
          g.x = ":buffer-close";
      };

        keys.insert = {
          j = { k = "normal_mode";};
        };
      };      
        
       }; 
}

