{ options, config, lib, pkgs, ... }:

with lib;
let cfg = config.n.programs.discord;
in
{
  options.n.programs.discord = with types; {
    enable = mkBoolOpt false "Whether or not to enable discord.";
  };

  config =
    mkIf cfg.enable { environment.systemPackages = with pkgs; [ discord-canary webcord]; };
}