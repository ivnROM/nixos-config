{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };
    
    nvf = {
      url = "github:notashelf/nvf";
      #inputs.nipkgs.follows = "nixpkgs"; 
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, hypr-dynamic-cursors, nvf, ... }: {
    nixosConfigurations.maelstrom = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	./hosts/maelstrom/configuration.nix
	inputs.stylix.nixosModules.stylix
        nvf.nixosModules.default
	home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.ivan = ./home/home.nix;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
      specialArgs = { inherit inputs; };
    };
  };
}
