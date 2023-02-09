{ pkgs, config, ... }:
{
home = {
	sessionVariables = {
	  
	  	EDITOR = "hx";
      BROWSER = "librewolf";
      TERMINAL = "kitty";
	  	NIXOS_OZONE_WL = "1";
      # QT_SCALE_FACTOR = "1";
      MOZ_ENABLE_WAYLAND = "1";
      # SDL_VIDEODRIVER = "wayland";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
	};
 };
}
