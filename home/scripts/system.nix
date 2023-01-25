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
in
{
  home.packages = with pkgs; [
    nrb
    ndg
  ];
}
