{
  nixpkgs,
  self,
  outputs,
  ...
}: let
  inputs = self.inputs;

  home-manager = inputs.home-manager.nixosModules.home-manager;
  homes = ../homes;
in {
  nixbox = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs outputs;};
    modules = [
      # this list defines which files will be imported to be used as "modules" in the system config
      ./nixbox/configuration.nix

      # use the nixos-module for home-manager
      home-manager
      homes
    ];
  };
}
