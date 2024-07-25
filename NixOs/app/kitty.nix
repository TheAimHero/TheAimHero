{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      size = 12;
    };
    theme = "Catppuccin-Mocha";
    settings = {
      copy_on_select = "yes";
      allow_remote_control = "socket-only";
      listen_on = "unix:/tmp/kitty";
      undercurl_style = "thin-sparse";
      cursor_beam_thickness = "1.0";
      cursor_underline_thickness = "1.0";
      cursor_blink_interval = 0;
      scrollback_lines = 2000;
      wheel_scroll_multiplier = "5.0";
      wheel_scroll_min_lines = 3;
      confirm_os_window_close = 0;
      mouse_hide_wait = "3.0";
      open_url_with = "default";
      enable_audio_bell = "no";
      url_prefixes = "file ftp ftps gemini git gopher http https irc ircs kitty mailto news sftp ssh";
      detect_urls = "yes";
      show_hyperlink_targets = "yes";
      mouse_map = "ctrl+left release grabbed,ungrabbed mouse_handle_click link";
      strip_trailing_spaces = "always";
      select_by_word_characters = "-";
      focus_follows_mouse = "yes";
      pointer_shape_when_grabbed = "arrow";
      default_pointer_shape = "beam";
      pointer_shape_when_dragging = "hand";
      background_opacity = "0.8";
      dynamic_background_opacity = "yes";
    };
    shellIntegration.enableZshIntegration = true;
    keybindings = {
      "ctrl+equal" = "change_font_size all +1.0";
      "ctrl+minus" = "change_font_size all -1.0";
      "ctrl+0" = "change_font_size all 0";
    };
  };
}
