{
  description = "Your new nix config";
  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "x86_64-linux"
      #"i686-linux"
      #"aarch64-darwin"
      #"x86_64-darwin"
    ];
  in {
    # Entrypoint for NixOS configurations
    nixosConfigurations = import ./hosts {inherit self;};

    # devshells that are provided by this flake
    # adding more packages to buildInputs makes them available
    # while inside the devshell - enetered via `nix develop`
    devShells = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            alejandra # opionated Nix formatter

            # example of bootstrapping self-contained shell
            # applications for your flake
            # this adds an `update` command to your shell
            # which'll update all inputs and commit
            (writeShellApplication {
              name = "update";
              text = ''
                nix flake update && git commit flake.lock -m "flake: bump inputs"
              '';
            })
          ];
        };
      }
    );

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };

  inputs = {
    # Nixpkgs (unstable)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # arrpc
    arrpc = {
      url = "github:notashelf/arrpc-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixos-hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    lanzaboote.url = "github:nix-community/lanzaboote";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprgrass = {
      url = "github:horriblename/hyprgrass";
      inputs.hyprland.follows = "hyprland";
    };
    neovim-flake = {
      url = "github:notashelf/neovim-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
