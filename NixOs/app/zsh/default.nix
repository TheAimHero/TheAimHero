{ pkgs, ... }:
let
  myAliases = {
    grep = "grep --color=auto";
    egrep = "egrep --color=auto";
    fgrep = "fgrep --color=auto";
    # confirm before overwriting something;
    cp = "cp -i";
    mv = "mv -i";
    rm = "rm -i";
    # Diffrent neovim configs;
    vi = "nvim --noplugins --cmd 'colorscheme habamax'";
    #lsd remaps;
    l = "ls -l --color=auto";
    la = "ls -a --color=auto";
    lla = "ls -la --color=auto";
    lt = "ls --tree";
    ls = "lsd";
    # quality remaps;
    cd = "z";
    xx = "exit";
    clr = "clear";
  };
  myKeybinds = builtins.readFile (./keybinds.sh);
  myConf = builtins.readFile (./zsh-conf.sh);
in
{
  programs = {
    zsh = {
      enable = true;
      shellAliases = myAliases;
      envExtra = builtins.readFile (./zsh-exports.sh);
      plugins = [
        {
          name = "fzf-tab";
          src = pkgs.fetchFromGitHub {
            owner = "Aloxaf";
            repo = "fzf-tab";
            rev = "14e16f0";
            sha256 = "o8hgnTl84nI7jMVfA5jEcDXkMFFlnxKbRva+l/Fx4jI=";
          };
        }
      ];
      initExtra = builtins.concatStringsSep "\n" [ myKeybinds myConf ];
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "tmux" "git" "vi-mode" "fzf" "kind" "aws" "docker" "gh" "golang" "kubectl" ];
      };
    };
  };
}
