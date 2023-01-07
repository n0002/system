{ pkgs, ... }:
{
 programs.helix = {
    enable = true;
    
    settings = {
      theme = "catppucin_mocha";
      editor = {
        line-number = "relative";
        mouse = false;
        bufferline = "multiple";
        };
    };
  };
}
