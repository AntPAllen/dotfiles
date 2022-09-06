{
  description = "Home Manager configuration of Anthony Allen";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
      homeConfigurations.linux = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./modules/home.nix
          ./modules/cli.nix
          ./modules/nvim.nix

          # {
          #   home = {
          #     username = "anthony";
          #     homeDirectory = "/home/anthony";
          #     stateVersion = "22.05";
          #     #system = "x86_64-linux";
          #   };
          # }
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}