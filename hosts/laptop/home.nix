{ config, lib, pkgs, ... }:

{
  imports =
     (import ../../home/programs/default.nix) ++
     (import ../../home/terminals/default.nix) ++
     (import ../../home/browsers/default.nix) ++
     (import ../../home/scripts/default.nix) ++
     (import ../../home/editors/neovim/neovim.nix) ++
     (import ../../home/desktop/default.nix) ++
     (import ../../home/shell);

  home = {
    username = "n";
    homeDirectory = "/home/n";
  };
  
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "22.05";

 services.picom = { 
        enable = true;

 };

 programs.gpg = {
   enable = true;
};
 
 services.gpg-agent = {
   enable = true;
};

 home.packages = with pkgs; [
 nitrogen
 sxiv 
 betterdiscordctl
 pavucontrol
 keepassxc
 openssl
 dmenu
 gnumake
 gnupg
 pinentry
 tmux
 rofi
 nerdfonts
 ranger
 spotify
 anki-bin
 lxappearance
 ytfzf
];
}

