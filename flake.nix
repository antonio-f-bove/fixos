{
  description = "A very basic flake that aims to become my system configuration!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # NOTE: fixos is the hostname configured in configuration.nix
    nixosConfiguration.fixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import th provious configuration.nix we used, 
        # so the old configuration file still takes effect
        ./configuration.nix
      ];
    };
  };
}
