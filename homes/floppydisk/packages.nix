{pkgs, ...}: {
  home.packages = with pkgs; [
    # utils
    handbrake
    thunderbird
    picard
    rpi-imager
    obs-studio
    yt-dlp
    _1password-gui
    _1password
    git-credential-1password
    firefox-devedition
    rdesktop
    _3llo
    gimp
    qemu
    virt-manager
    exactaudiocopy
    abcde
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
    kitty
    wofi
    grim
    wlogout
    hyprpaper
    brightnessctl
    josm

    # fetch
    neofetch
    yafetch
    cpufetch
    bunnyfetch
    nitch
    screenfetch
    starfetch

    # devtools
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
    processing

    # langs
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
    dotnet-sdk
    jdk17
    maven
    purescript
    lua
    flutter

    # comms
    nheko
    vesktop
    caprine-bin
    teamspeak5_client

    # gaming
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
    openrct2
    osu-lazer-bin

    # media
    vlc
    libsForQt5.vvave
    tidal-hifi
    youtube-tui
    mpv
    spotify
    spicetify-cli

    # zsh themes
    zsh-powerlevel10k
  ];
}
