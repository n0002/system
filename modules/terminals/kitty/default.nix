{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.terminals.kitty;
in
{
  options.n.terminals.kitty = with types; {
    enable = mkBoolOpt true "Whether or not to enable kitty.";
  };

  config = mkIf cfg.enable {
    n.home.extraOptions = {
      programs.kitty = {
          enable = true;
          
          font = {
            name = "Iosevka Nerd Font"; 
            size = 12;
            };
          
          settings = {
            enable_audio_bell = false; 
            update_interval_check = 0;
            scrollback_lines = 1000;

            copy_on_select = "clipboard";

            background_opacity = "0.8";

            #tabs
            tab_bar_style = "powerline";
            tab_bar_align = "left";
            tab_bar_min_tabs = "2";       
            confirm_os_window_close = 0;
            
            inactive_border_color = "#000000";
            active_border_color = "#ffccff";
            window_margin_width = "1";
            window_margin_padding = "2.0";
       };
            keybindings = {
              "ctrl+shift+h" = "previous_tab";
              "ctrl+shift+l" = "next_tab";
              "ctrl+shift+t" = "new_tab";
              "ctrl+shift+w" = "close_tab";
              "ctrl+shift+r" = "set_tab_title";
              "alt+l" = "next_window";
              "alt+h" = "previous_window";
              "alt+j" = "next_layout";
              "alt+k" = "previous_layout";
              "alt+w" = "close_window";
              
            };
            extraConfig = ''
              
            foreground            #f8f8f2
            background            #000000
            selection_foreground  #ffffff
            selection_background  #44475a
            url_color #8be9fd
            color0  #21222c
            color8  #6272a4
            color1  #ff5555
            color9  #ff6e6e
            color2  #50fa7b
            color10 #69ff94
            color3  #f1fa8c
            color11 #ffffa5
            color4  #bd93f9
            color12 #d6acff
            color5  #ff79c6
            color13 #ff92df
            color6  #8be9fd
            color14 #a4ffff
            color7  #f8f8f2
            color15 #ffffff
            cursor            #f8f8f2
            cursor_text_color background
            active_tab_foreground   #282a36
            active_tab_background   #f8f8f2
            inactive_tab_foreground #282a36
            inactive_tab_background #6272a4
            mark1_foreground #282a36
            mark1_background #ff5555        
      '';
            # theme = "Dracula";
      };
     };
    };
}
