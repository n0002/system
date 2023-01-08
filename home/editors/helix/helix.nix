{ pkgs, ... }:
{
 programs.helix = {
    enable = true;
    
    settings = {
      theme = "mellow";
      editor = {
        line-number = "relative";
        mouse = false;
        bufferline = "multiple";
        shell = ["bash" "-c"];
        };

        keys.normal = {
          S = ":w"; # save file
          Q = ":q"; # quit helix
        };

        keys.insert = {
          j = { k = "normal_mode";};
        };
    };
  };
}

