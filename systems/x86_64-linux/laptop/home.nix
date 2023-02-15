{ inputs, config, lib, pkgs, ... }:

{
  imports =
     (import ../../../modules/programs/default.nix) ++
     (import ../../../modules/terminals/default.nix) ++
     (import ../../../modules/browsers/default.nix) ++
     (import ../../../modules/scripts/default.nix) ++
     (import ../../../modules/editors/default.nix) ++
     (import ../../../modules/desktop/default.nix) ++
     (import ../../../modules/shell);

  home = {
    username = "n";
    homeDirectory = "/home/n";
  };
  
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.05";

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
 keepassxc
 openssl
 dmenu
 gnumake
 gnupg
 pinentry
 tmux
 nerdfonts
 ranger
 spotify
 anki-bin
 lxappearance
 gotop
 ytfzf
];
}

