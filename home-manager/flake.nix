{
  description = "Example home-manager from non-nixos system";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  # inputs.nixpkgs.url = "path:/home/michael/Repositories/nix/nixpkgs";
  # inputs.nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

  inputs.home-manager = {
    url = "github:nix-community/home-manager";
    # url = "path:/Users/michael/Repositories/nix/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, ... }@inputs:
    {
      homeConfigurations = {
        linux = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, ... }:
            {
              xdg.configFile."nix/nix.conf".source = ./configs/nix/nix.conf;
              nixpkgs.config = import ./configs/nix/config.nix;
              imports = [
                ./modules/cli.nix
                ./modules/nvim.nix
              ];
              # Let Home Manager install and manage itself.
              programs.home-manager.enable = true;
              targets.genericLinux.enable = true;
              
            };
          stateVersion = "22.05";
          system = "x86_64-linux";
          homeDirectory = "/home/anthony";
          username = "anthony";
          
        };
      };
    };
}