{pkgs, ... }:

{
  programs = {
    bash = {
      enable = true; 
      shellAliases = { 
      
      "ls" = "ls --color=auto";
      "ll" = "ls -lav --ignore=..";   # show long listing of all except ".."
      "l" = "ls -lav --ignore=.?*";   # show long listing but no hidden dotfiles except "."
      "dra" = "cd /home/n/dra-cla && ./dra-cla"; # open dra-cla
      "ani" = "cd /home/n/ani-cli && ./ani-cli";
      "dots" = "cd ~/.dots"; #dotfiles
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
