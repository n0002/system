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
   nvim-autopairs
   luasnip
   cmp_luasnip
   cmp-buffer
   cmp-path
   cmp-cmdline
   cmp-treesitter
   lspkind-nvim
   nvim-lspconfig
   
# -- Colors -- #
   catppuccin-nvim
   tokyonight-nvim
   ];
 };
 
 home.packages = with pkgs; [
    rnix-lsp
    sumneko-lua-language-server

    gopls
    pyright
    rust-analyzer
    stylua
    nixpkgs-fmt
    rustfmt
    lldb
 ];

}
