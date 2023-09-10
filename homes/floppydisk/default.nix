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
    file.".config/hypr/hyprpaper.conf".text = ''
      preload = ${/. + ../../misc/wallpapers/oneshot-1.jpg}
      wallpaper = ,${/. + ../../misc/wallpapers/oneshot-1.jpg}
    '';
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
      firefox-devedition
      inputs.arrpc.packages.${pkgs.system}.arrpc
      rdesktop
      _3llo
      gimp
      qemu
      virt-manager
      exactaudiocopy
      fsv
      lsd
      lsdvd
      thefuck
      zip
      unzip
      notion-app-enhanced
      libresprite
      qbittorrent
      wine
      vifm
      cloudflared
      ansible
      just
      pwgen
      grafx2
      libreoffice-fresh
      wiki-tui
      calcurse

      # Fetch
      neofetch
      yafetch
      cpufetch
      bunnyfetch
      nitch
      screenfetch
      starfetch

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
      mongosh
      httpie
      ngrok
      mycli
      squirrel-sql
      figma-linux

      # Langs
      openscad
      nodejs_18
      nodePackages.yarn
      nodePackages.ts-node
      nodePackages.pnpm
      php82
      php82Packages.composer
      deno
      python310
      python310Packages.pip
      python310Packages.discordpy
      dotnet-sdk
      jdk17
      maven
      purescript
      lua
      flutter

      # Comms
      nheko
      element-desktop
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
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
      fceux
      snes9x
      heroic
      openrct2
      osu-lazer-bin

      # Media
      vlc
      libsForQt5.vvave
      tidal-hifi
      spotify-tui
      youtube-tui
      mpv

      # zsh Themes
      zsh-powerlevel10k
    ];
  };

  # Add stuff for your user as you see fit:
  programs = {
    # Enable home-manager
    home-manager.enable = true;

    # Enable z-shell
    zsh = {
      enable = true;
      shellAliases = {
        ls = "lsd";
        ll = "ls -l";
        la = "ls -la";
      };
      history = {
        size = 10000;
        path = "$HOME/.config/zsh/history";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "thefuck"
        ];
        custom = "$HOME/.oh-my-custom";
        theme = "powerlevel10k/powerlevel10k";
      };
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];
      initExtra = ''
        source ~/.p10k.zsh
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

    irssi = {
      enable = true;
      networks = {
        znc = {
          nick = "floppydisk";
          server = {
            address = "irc.nick99nack.com";
            port = 8888;
            autoConnect = true;
            ssl.enable = false;
          };
        };
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = import ./hyprland.nix;
  };

  programs.waybar = {
    enable = true;
    settings = import ./waybar.nix;
    style = import ./waybar-style.nix;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
