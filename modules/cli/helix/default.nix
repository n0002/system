{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.cli.helix;
in
{
  options.n.cli.helix = with types; {
    enable = mkBoolOpt true "Whether or not to enable helix.";
  };

  config = mkIf cfg.enable { 
      n.home.extraOptions = {
      programs.helix = {
        enable = true;
        
        settings = {
        theme = "mocha";

        editor = {
          line-number = "relative";
          mouse = false;
          bufferline = "multiple";
          shell = ["bash" "-c"];
          };

          keys.normal = {
            S = ":w"; # save file
            Q = ":q"; # quit helix
            g.x = ":buffer-close";
        };

          keys.insert = {
            j = { k = "normal_mode";};
      };
    };             
  }; 

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
    };
  };
}

