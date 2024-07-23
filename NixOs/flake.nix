{
  description = "Init";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        LaptopNix = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };
      homeConfigurations = {
        vedant = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}
