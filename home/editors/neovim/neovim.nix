{ pkgs, ... }:

{
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
}
