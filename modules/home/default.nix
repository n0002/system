inputs@{ options, config, pkgs, lib, home-manager, ... }:

with lib;
let cfg = config.n.home;
in
{
  options.n.home = with types; {
    file = mkOpt attrs { }
      "A set of files to be managed by home-manager's <option>home.file</option>.";
    configFile = mkOpt attrs { }
      "A set of files to be managed by home-manager's <option>xdg.configFile</option>.";
    extraOptions = mkOpt attrs { } "Options to pass directly to home-manager.";
  };

  config = {
    n.home.extraOptions = {
      home.stateVersion = config.system.stateVersion;
      home.file = mkAliasDefinitions options.n.home.file;
      xdg.enable = true;
      xdg.configFile = mkAliasDefinitions options.n.home.configFile;
    };

    home-manager = {
      useUserPackages = true;

      users.${config.n.user.name} =
        mkAliasDefinitions options.n.home.extraOptions;
    };
  };
}
