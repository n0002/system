{
  description = "NixOS config";

  inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

	nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
		  url = github:nix-community/home-manager;
		  inputs.nixpkgs.follows = "nixpkgs";
				};
		
    hyprland = {
      url = github:hyprwm/Hyprland;
      };

		};

  outputs = { self, nixpkgs, home-manager, nixos-hardware, hyprland }: 
    let
	  system = "x86_64-linux";
	  pkgs = import nixpkgs {
		 inherit system;
		 config.allowUnfree = true;
		 };
		 lib = nixpkgs.lib;
      in {
		 nixosConfigurations = {
		 laptop = lib.nixosSystem {
				inherit system;

				modules = [ 
				
        ./hosts/laptop/system.nix
        
        nixos-hardware.nixosModules.framework-12th-gen-intel
        
        hyprland.nixosModules.default
        { programs.hyprland.enable = true; }

				home-manager.nixosModules.home-manager {
				  home-manager.useGlobalPkgs = true;
				  home-manager.useUserPackages = true;
				  home-manager.users.n = {
						imports = [ ./hosts/laptop/home.nix ];
						  };
						}
				];
		      };
		   };
  };
}
