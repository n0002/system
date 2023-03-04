
{ options, config, lib, pkgs, ...}:

with lib;
let
  cfg = config.n.tools.python;
in 
{
  options.n.tools.python = with types; {
    enable = mkBoolOpt true "Whether or not to enable python and python lsp packages.";
  };

  config = mkIf cfg.enable {
    n.home.extraOptions = {
      home.packages = with pkgs; [ python311 nodePackages.pyright python311Packages.python-lsp-server];
      
       }; 
    
  };
} 