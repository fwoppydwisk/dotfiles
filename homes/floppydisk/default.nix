# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  outputs,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    ./neovim-flake.nix
  ];

  home = {
    username = "floppydisk";
    homeDirectory = "/home/floppydisk";
    packages = with pkgs; [steam vscode _1password-gui _1password neofetch microsoft-edge webcord-vencord jetbrains.ruby-mine jetbrains.rider jetbrains.phpstorm jetbrains.idea-ultimate];
  };

  # Add stuff for your user as you see fit:
  programs = {
    # Enable neovim
    neovim.enable = true;

    # Enable home-manager
    home-manager.enable = true;

    # enable git and configure users
    git = {
      enable = true;
      userName = "Frankie B.";
      userEmail = "git@diskfloppy.me";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
