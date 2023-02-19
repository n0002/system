{
  description = "NixOS config";

  inputs = {

	
  nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
  unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  
  nixos-hardware.url = "github:NixOS/nixos-hardware/master";

  home-manager = {
		  url = "github:nix-community/home-manager";
		  inputs.nixpkgs.follows = "nixpkgs";
				};

  snowfall-lib = {
    url = "github:snowfallorg/lib";
    inputs.nixpkgs.follows = "nixpkgs";
  };

	snowfall-flake = {
    url = "snowfallorg/flake";
    inputs.nixpkgs.follows = "unstable";
  };
  	
  hyprland = {
      url = "github:hyprwm/Hyprland";
      };

  webcord.url = "github:fufexan/webcord-flake";
		};

    outputs = inputs:
      inputs.snowfall.lib.mkFlake {
        inherit inputs;

        src =  ./.;

        overlays = with inputs; [
          
        ];

        channels-config.allowUnfree = true;

        systems.modules = with inputs; [
          
          nixos.hardwareos.nixosModules.framework
          
          home-manager.nixosModules.home-manager

          hyprland.nixosModules.default
        ]; 
      };

  # outputs = inputs @ { webcord, self, nixpkgs, home-manager, nixos-hardware, hyprland }: 
  #   let
  #     # Variables that can be used in the config files.
  #     user = "n";
  #   in
  #   # Use above variables in ...
  #   {
  #     nixosConfigurations = (
  #       # NixOS configurations
  #       import ./systems/x86_64-linux/laptop {
  #         # Imports ./hosts/default.nix
  #         inherit (nixpkgs) lib;
  #         inherit inputs nixpkgs nixos-hardware home-manager user hyprland webcord ; # Also inherit home-manager so it does not need to be defined here.
  #       }
  #     );
  #   };

}
