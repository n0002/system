{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.programs.neofetch;
in
{
  options.n.programs.neofetch = with types; {
    enable = mkBoolOpt true "Whether or not to enable neofetch.";
  };

  config = mkIf cfg.enable { 
    environment.systemPackages = with pkgs; [neofetch];  
};
}