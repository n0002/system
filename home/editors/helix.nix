{ pkgs, ... }:
{
 programs.helix = {
    enable = true;
    
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        mouse = false;
        bufferline = "multiple";
        };
    };
  };
}
