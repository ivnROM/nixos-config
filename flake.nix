{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };
    
    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
    # If you're worried about mismatched versions
    # when using, e.g., `swww` from your own script,
    # you can also do the following.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, hypr-dynamic-cursors, ... }: {
    nixosConfigurations.maelstrom = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	./hosts/maelstrom/configuration.nix
	inputs.stylix.nixosModules.stylix
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
