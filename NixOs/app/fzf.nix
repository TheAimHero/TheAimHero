{ ... }:
let
  colors = {
    "bg+" = "#313244";
    "bg" = "-1";
    "hl" = "#f38ba8";
    "fg" = "#cdd6f4";
    "fg+" = "#cdd6f4";
    "hl+" = "#f38ba8";
  };
  defaultOptions = [
    "--cycle"
    "--no-scrollbar"
    "--border=rounded"
    "--layout=reverse"
    "--inline-info"
    "--min-height=20"
    "--preview 'bat --color=always {}'"
    "--preview-window '~3'"
  ];
in
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = false;
    colors = colors;
    defaultOptions = defaultOptions;
  };
}
