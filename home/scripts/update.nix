{ pkgs, ... }:

let
  update-sys = pkgs.writeShellScriptBin "update-sys" ''
  pushd ~/.dotfiles 
  sudo nixos-rebuild switch --flake .#laptop
  '';
  sys-gc = pkgs.writeShellScriptBin "sys-gc" ''
  nix-collect-garbage -d
  sleep 2
  update-sys
  '';
in
{
  home.packages = with pkgs; [
    update-sys
    sys-gc
  ];
}
