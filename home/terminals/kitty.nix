{pkgs, ... }:

{
  programs = {
    kitty = {
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
        tab_bar_min_tabs = "1";       
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
  };
 };
}
