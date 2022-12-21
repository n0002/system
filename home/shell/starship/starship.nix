{pkgs, lib, ... }:

{ 
  programs = {
    starship = {
      enable = true;
      
      enableBashIntegration = true;

      settings = {
       #  add_newline = false;
        # format = lib.concatStrings [
         #  "$line_break"
          # "$package"
           #"$line_break"
           #"$character"
         #];
          #scan_timeout = 10;
          character = {
          success_symbol = "[➜](#ffccff)";
          error_symbol = "[➜](bold red)";

    };
   };
  };
 };
}
