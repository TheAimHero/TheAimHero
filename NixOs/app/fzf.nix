{ ... }:
let
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
    defaultOptions = defaultOptions;
  };
}
