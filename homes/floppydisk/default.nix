# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
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
    ./arrpc.nix
  ];

  home = {
    username = "floppydisk";
    homeDirectory = "/home/floppydisk";
    packages = with pkgs; [
      steam
      gzdoom
      obs-studio
      yt-dlp
      vlc
      vscode
      _1password-gui
      _1password
      neofetch
      microsoft-edge
      jetbrains.ruby-mine
      jetbrains.rider
      jetbrains.phpstorm
      jetbrains.idea-ultimate
      jetbrains.webstorm
      inputs.arrpc.packages.${pkgs.system}.arrpc
      lazygit
      dotnet-sdk
      minecraft
      mongodb-compass
      tidal-hifi
      teamspeak5_client
      rdesktop
      pfetch
      caprine-bin
      lightworks
      httpie
      partition-manager
      _3llo
    ];
  };

  # Add stuff for your user as you see fit:
  programs = {
    # Enable home-manager
    home-manager.enable = true;

    # Enable fish shell
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable fish_greeting
        export GPG_TTY=$(tty)
      '';
    };

    # enable git and configure users
    git = {
      enable = true;
      userName = "Frankie B.";
      userEmail = "git@diskfloppy.me";
      extraConfig = {
        # Sign all commits using ssh key
        commit.gpgsign = true;
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/id_ed25519.pub";
      };
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
