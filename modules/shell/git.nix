{pkgs, ... }:

{
  home.packages = with pkgs; [ gh git git-crypt ];
  
  programs = {
    git = {
      enable = true; 

    userEmail = "00004444@skiff.com";
    userName = "n";

    extraConfig = {
    init = {defaultBranch = "main";};
    core.editor = "hx";
    };

    ignores = ["*~" "*result*" ".direnv"];
     
   };
  };
}