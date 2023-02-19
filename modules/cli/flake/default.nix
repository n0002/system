{ options, config, pkgs, lib, ... }:

with lib;
let
  cfg = config.n.cli.flake;
in
{
 options.n.cli.flake = with types; {
    enable = mkBoolOpt true "Whether or not to enable flake.";
  };
 config = mkIf cfg.enable {
  environment.systemPackages = with pkgs; [ snowfallorg.flake];
  };
}
