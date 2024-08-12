{ config, pkgs, ... }:

{
  imports = [
    ./app/zsh
    ./app/tmux
    ./app/lf
    ./app/neovim
    ./app/fzf.nix
    ./app/git.nix
    ./app/kitty.nix
    ./app/others.nix
  ];

  home = {
    username = "vedant";
    homeDirectory = "/home/vedant";
    packages = with pkgs; [
      pnpm
      lsd
      bat
      btop
      neofetch
      discord
      spotify
      vscode
      kitty
      obsidian
      vlc
      gh
      typescript
      bun
      (google-chrome.override {
        commandLineArgs = [
          "--enable-features=UseOzonePlatform"
          "--ozone-platform=x11"
        ];
      })
    ];
    file = { };
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
      VISUAL = "nvim";
      SUDOEDIT = "nvim";
      PAGER = "bat";
      BROWSER = "firefox";
    };
    stateVersion = "24.05"; # Do not change this value.
  };
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
    pointerCursor = {
      enable = true;
      flavor = "mocha";
      accent = "blue";
    };
  };
  nixpkgs.config.allowUnfree = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
