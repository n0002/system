{ options, config, lib, pkgs, ... }:

with lib;
let 
  cfg = config.n.desktop.imv;
in
{
   options.n.desktop.imv = with types; {
    enable = mkBoolOpt true "Whether or not to enable imv.";
  };
 config = mkIf cfg.enable {
  environment.systemPackages = with pkgs; [ 
    imv
    ];
  };

}
