{pkgs, lib, ... }:

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
       
        confirm_os_window_close = 1;
        
   };
  };
 };
}
