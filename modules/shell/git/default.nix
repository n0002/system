{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.shell.git;
in
{
  options.n.shell.git = with types; {
    enable = mkBoolOpt true "Whether or not to enable git.";
  };

  config = mkIf cfg.enable { 
    n.home.extraOptions = {
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
    };
  };
}
