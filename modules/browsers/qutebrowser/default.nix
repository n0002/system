{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.browsers.qutebrowser;
in
{
  options.n.browsers.qutebrowser = with types; {
    enable = mkBoolOpt true "Whether or not to enable qutebrowser.";
  };

  config = mkIf cfg.enable { 
      n.home.extraOptions = {

        home.packages = with pkgs; [ qutebrowser-qt6 haskellPackages.bisc ];
          home.file.".config/qutebrowser/config.py".source = ./config.py;
          
          nixpkgs.overlays = [
            (final: prev: { qutebrowser = prev.qutebrowser.override { enableWideVine = true; }; })
          ];
    };
  };
}