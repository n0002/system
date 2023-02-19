{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.shell.starship;
in
{
  options.n.shell.starship = with types; {
    enable = mkBoolOpt true "Whether or not to enable starship.";
  };

  config = mkIf cfg.enable {
    n.home.extraOptions = {
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
              success_symbol = "[›](#ffccff)";
              error_symbol = "[›](bold red)";

    };
   };
  };
 };
};
};
}
