{ inputs, nixpkgs, nixos-hardware, lib, home-manager, hyprland, webcord, user}:

let
  system = "x86_64-linux"; # System architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # Allow proprietary software
    overlays = [
      webcord.overlays.default
    ];
  };

  lib = nixpkgs.lib;
in
{
  laptop = lib.nixosSystem {
    # Laptop profile
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [

      ./laptop/system.nix
      
      nixos-hardware.nixosModules.framework-12th-gen-intel

      hyprland.nixosModules.default
      { programs.hyprland.enable = true; }
      
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user inputs; };
        home-manager.users.${user} = {
          imports = [ (import ./laptop/home.nix) ];
          };
        }
    ];
  };

}
