{pkgs, ... }:

{
  programs = {
    bash = {
      enable = true; 
      shellAliases = { 
      
      "ls" = "ls --color=auto";
      "ll" = "ls -lav --ignore=..";   # show long listing of all except ".."
      "l" = "ls -lav --ignore=.?*";   # show long listing but no hidden dotfiles except "."
      "dra" = "cd ~/dra-cla && ./dra-cla"; # open dra-cla
      "ani" = "cd ~/ani-cli && ./ani-cli";
      "dots" = "cd ~/.dotfiles"; #dotfiles
      "gallery" = "gallery-dl";
      ".."  = "cd .. ";
      };

      bashrcExtra = ''
        export PATH="$HOME/.local/bin:$PATH";
        export PATH="$HOME/.dots/scripts:$PATH";
        '';
   };
  };
}
