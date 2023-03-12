{
  description = "NixOS config";

  inputs = {

	
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  # unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  
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
    url = "github:snowfallorg/flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  	
  hyprland = {
      url = "github:hyprwm/Hyprland";
      };

  webcord.url = "github:fufexan/webcord-flake";
		};

    outputs = inputs:
      inputs.snowfall-lib.mkFlake {
        inherit inputs;

        src =  ./.;

        overlays = with inputs; [
            snowfall-flake.overlay          
        ];

        channels-config.allowUnfree = true;

        systems.modules = with inputs; [
          
          nixos-hardware.nixosModules.framework
          
          home-manager.nixosModules.home-manager

          hyprland.nixosModules.default
        ]; 
      };

  }
