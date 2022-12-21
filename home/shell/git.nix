{pkgs, ... }:

{
  home.packages = with pkgs; [ git git-crypt ];
  
  programs = {
    git = {
      enable = true; 

    userEmail = "00004444@skiff.com";
    userName = "n";

    extraConfig = {
    init = {defaultBranch = "main";};
    };


      };
     };
}
