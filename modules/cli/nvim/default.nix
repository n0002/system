{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.cli.nvim;
in
{
  options.n.cli.nvim = with types; {
    enable = mkBoolOpt true "Whether or not to enable nvim.";
  };

  config = mkIf cfg.enable { 
      n.home.extraOptions = {
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
 };
};
}