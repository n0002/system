{ options, config, lib, pkgs, ...}:

with lib;
let
  cfg = config.n.tools.go;
in 
{
  options.n.tools.go = with types; {
    enable = mkBoolOpt true "Whether or not to enable go and go lsp packages.";
  };

  config = mkIf cfg.enable {
    n.home.extraOptions = {
      home.packages = with pkgs; [ go gopls];
    };
  };
} 