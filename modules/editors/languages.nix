{pkgs, ... }:

{
  home.packages = with pkgs; [
    rnix-lsp
    sumneko-lua-language-server
    nil
    gopls
    pyright
    rust-analyzer
    stylua
    nixpkgs-fmt
    rustfmt
    lldb


  ];
}
