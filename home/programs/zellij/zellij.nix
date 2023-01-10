{pkgs, ... }:
{
  programs = {
    zellij = {
      enable = true;
    };
  };

  home.file.".config/zellij/config.kdl".source = ./config.kdl;
  home.file.".config/zellij/layouts/main.yaml".source = ./layouts/main.yaml;
  # home.file.".config/zellij/config.kdl".source = ./config.kdl;

}
