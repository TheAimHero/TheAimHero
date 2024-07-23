{ pkgs, ... }:
let
  tmux-nvim = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux.nvim";
      version = "da618e0";
      src = pkgs.fetchFromGitHub {
        owner = "aserowy";
        repo = "tmux.nvim";
        rev = "da618e0";
        sha256 = "Ie/aW08JgvuwDAEXWa+OQpouBGRUci2wa1ih54BuSwI=";
      };
    };
in
{
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    disableConfirmationPrompt = true;
    newSession = false;
    shortcut = "a";
    escapeTime = 1;
    keyMode = "vi";
    mouse = true;
    plugins = with pkgs;[
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_window_status_enable "yes"
          set -g @catppuccin_pane_border_style "fg=blue" 
          set -g @catppuccin_window_status_icon_enable "yes"
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator ""
          set -g @catppuccin_status_right_separator_inverse "no"
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_background "default"
          set -g @catppuccin_status_modules_right "directory session"
          set -g @catppuccin_status_modules_left ""
          set -g @catppuccin_status_connect_separator "no"
          set -g @catppuccin_directory_text "#{pane_current_path}"
        '';
      }
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.yank
      {
        plugin = tmux-nvim;
        extraConfig = ''
          set -g @tmux-nvim-navigation true
          set -g @tmux-nvim-navigation-cycle true
          set -g @tmux-nvim-navigation-keybinding-left 'C-h' 
          set -g @tmux-nvim-navigation-keybinding-down 'C-j' 
          set -g @tmux-nvim-navigation-keybinding-up 'C-k' 
          set -g @tmux-nvim-navigation-keybinding-right 'C-l' 
          set -g @tmux-nvim-resize false
        '';
      }

    ];
    extraConfig = builtins.readFile (./tmux.conf);
  };
}
