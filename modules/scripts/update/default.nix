{ options, config, lib, pkgs, ... }:

with lib;
let
  nrb = pkgs.writeShellScriptBin "nrb" ''
  pushd ~/.dotfiles 
  sudo nixos-rebuild switch --flake .#laptop
  '';
  ndg = pkgs.writeShellScriptBin "ndg" ''
  sudo nix-collect-garbage -d
  sleep 2
  nrb
  '';
  ultrawide = pkgs.writeShellScriptBin "ultrawide" ''
  wlr-randr --output eDP-1 --off 
  '';
cfg = config.n.scripts.update;
in
{
  options.n.scripts.update = with types; {
    enable = mkBoolOpt true "Whether or not to enable update scripts.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      nrb
      ndg
      ultrawide
  ];
  };
}
