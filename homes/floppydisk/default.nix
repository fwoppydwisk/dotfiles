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
      # Utils
      handbrake
      thunderbird
      picard
      realvnc-vnc-viewer
      rpi-imager
      obs-studio
      yt-dlp
      _1password-gui
      _1password
      git-credential-1password
      neofetch
      microsoft-edge
      inputs.arrpc.packages.${pkgs.system}.arrpc
      rdesktop
      pfetch
      partition-manager
      _3llo
      gimp
      qemu
      virt-manager

      # DevTools
      github-desktop
      gh
      codeql
      vscode
      jetbrains.ruby-mine
      jetbrains.rider
      jetbrains.phpstorm
      jetbrains.idea-ultimate
      jetbrains.webstorm
      lazygit
      wakatime
      mongodb-compass
      httpie

      # Langs
      openscad
      nodejs_18
      nodePackages.yarn
      nodePackages.ts-node
      php82
      php82Packages.composer
      deno
      python310
      python310Packages.pip
      python310Packages.discordpy
      dotnet-sdk
      jdk17
      maven

      # Comms
      nheko
      element-desktop
      discord
      caprine-bin
      teamspeak5_client

      # Gaming
      rpcs3
      pcsxr
      pcsx2
      steam
      gzdoom
      minecraft
      dolphin-emu
      prismlauncher

      # Media
      vlc
      libsForQt5.vvave
      tidal-hifi
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
        init.defaultBranch = "master";
      };
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
