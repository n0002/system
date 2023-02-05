{pkgs, ... }:
{
  programs = {
    zellij = {
      enable = true;
    };
  };

  home.file.".config/zellij/config.kdl".source = ./config.kdl;
  home.file.".config/zellij/layouts/main.kdl".source = ./layouts/main.kdl;
  # home.file.".config/zellij/config.kdl".source = ./config.kdl;

}
