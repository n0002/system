{ pkgs, ... }:

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
in
{
  home.packages = with pkgs; [
    nrb
    ndg
    ultrawide
  ];
}
