{ pkgs, config, lib, ... }:

let 
  colors = import ../../../charm.nix; 
in
{
 programs.helix = {
    enable = true;
    
    settings = {
      theme = "charm";
      editor = {
        line-number = "relative";
        mouse = false;
        bufferline = "multiple";
        shell = ["bash" "-c"];
        };

        keys.normal = {
          S = ":w"; # save file
          Q = ":q"; # quit helix
      };

        keys.insert = {
          j = { k = "normal_mode";};
        };
      };      
        themes = {
         charm = let
        transparent = "none";
        normal = colors.normal;
        bright = colors.bright;
      in {
        "ui.menu" = {bg = normal.black;};
        "ui.menu.selected" = {bg = bright.black;};
        "ui.menu.scroll" = {
          fg = normal.black;
          bg = normal.black;
        };
        "ui.window" = normal.black;
        "ui.linenr" = {fg = normal.black;};
        "ui.linenr.selected" = {fg = normal.white;};
        "ui.popup" = {
          fg = normal.white;
          bg = normal.black;
        };
        "ui.popup.info" = {
          fg = normal.white;
          bg = transparent;
        };
        "ui.selection" = {
          fg = normal.black;
          bg = normal.blue;
        };
        "ui.selection.primary" = {modifiers = ["reversed"];};
        "comment" = {fg = bright.black;};
        "ui.statusline" = {
          fg = normal.white;
          bg = transparent;
        };
        "ui.statusline.inactive" = {
          fg = normal.black;
          bg = transparent;
        };
        "ui.help" = {
          fg = normal.white;
          bg = transparent;
        };
        "ui.cursor" = {
          modifiers = ["reversed"];
        };
        "ui.virtual.ruler" = {
          bg = "#1a1a1a";
        };
        "variable" = normal.white;
        "variable.builtin" = normal.yellow;
        "constant.numeric" = normal.yellow;
        "constant" = normal.yellow;
        "attributes" = normal.blue;
        "type" = normal.cyan;
        "ui.cursor.match" = {
          fg = normal.cyan;
          modifiers = ["underlined"];
        };
        "string" = normal.green;
        "variable.other.member" = normal.blue;
        "constant.character.escape" = normal.yellow;
        "function" = normal.yellow;
        "function.builtin" = normal.blue;
        "function.method" = normal.blue;
        "constructor" = normal.blue;
        "special" = normal.yellow;
        "keyword" = bright.magenta;
        "keyword.control.repeat" = normal.magenta;
        "label" = normal.magenta;
        "namespace" = normal.blue;
        "diff.plus" = normal.green;
        "diff.delta" = normal.yellow;
        "diff.minus" = normal.red;
        "diagnostic" = {
          modifiers = ["underlined"];
        };
        "ui.gutter" = {
          bg = transparent;
        };
        "info" = normal.blue;
        "hint" = normal.white;
        "debug" = normal.white;
        "warning" = normal.yellow;
        "error" = normal.red;
        "ui.virtual.whitespace" = {fg = bright.black;};
        "markup.heading.marker" = "#00b2ff";
        "markup.heading.1" = "#00b2ff";
        "markup.heading.2" = "#00b2ff";
        "markup.heading.3" = "#00b2ff";
        "markup.heading.4" = "#00b2ff";
        "markup.heading.5" = "#00b2ff";
        "markup.heading.6" = "#00b2ff";
        "markup.bold" = {
          modifiers = ["bold"];
        };
        "markup.italic" = {
          modifiers = ["italic"];
        };
        "markup.underline.link" = {
          fg = "#008a88";
          modifiers = ["underlined"];
        };
        "markup.raw.inline" = {
          bg = "#303030";
          fg = "#ff4f58";
        };
        "markup.list.unnumbered" = bright.black;
        "markup.list.numbered" = bright.black;
        "markup.raw.block" = {
          fg = bright.black;
        };
        "markup.link.url" = {
          fg = "#008a88";
          modifiers = ["underlined"];
        };
        "markup.link.label" = {
          fg = "#00b255";
        };
        "markup.link.text" = {
          fg = "#00b255";
        };
       }; 
    };
    };
}

