{ config, lib, pkgs, ... }:

{
  imports =
     (import ../../home/programs/default.nix) ++
     (import ../../home/terminals/default.nix) ++
     (import ../../home/browsers/default.nix) ++
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

 programs.neovim = {
   enable = true;
   viAlias = true;
   vimAlias = true;
 
# --- Plugins --- #

# Full list here,
# https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/vim/plugins/generated.nix

plugins = with pkgs.vimPlugins; [
   
   lualine-nvim
   vimwiki
   telescope-nvim
   plenary-nvim
   (nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars))
   harpoon
   undotree
   vim-fugitive

# -- Completion -- #
   nvim-cmp
   luasnip
   cmp_luasnip
   cmp-buffer
   cmp-path
   cmp-cmdline
   
# -- Colors -- #
   catppuccin-nvim
   tokyonight-nvim
   ];
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
 gotop
 ytfzf
];
}

