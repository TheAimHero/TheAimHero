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

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vedant";
  home.homeDirectory = "/home/vedant";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
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
    (google-chrome.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=x11"
      ];
    })
  ];

  nixpkgs.config.allowUnfree = true;

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    VISUAL = "nvim";
    SUDOEDIT = "nvim";
    PAGER = "bat";
    BROWSER = "firefox";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
