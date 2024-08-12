{ ... }:
let
  lfrc = builtins.readFile (./lfrc);
in
{
  xdg.configFile."lf/icons".source = ./icons;
  xdg.configFile."lf/lf_kitty_preview".source = ./lf_kitty_preview;
  xdg.configFile."lf/lf_kitty_clean".source = ./lf_kitty_clean;
  programs.lf = {
    enable = true;
    extraConfig = lfrc;
    commands = {
      zip = ''
        ''${{
            set -f
            mkdir $1
            cp -r $fx $1
            zip -r $1.zip $1
            rm -rf $1
        }}
      '';
      open = ''
        &{{
            case $(file --mime-type -Lb $f) in
                text/*) lf -remote "send $id \$$EDITOR \$fx";;
                *) for f in $fx; do $OPENER $f > /dev/null 2> /dev/null & done;;
            esac
        }}
      '';
      trash = ''%set -f; mv $fx ~/.trash'';
      extract = ''
        ''${{
            set -f
            case $f in
                *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf $f;;
                *.tar.gz|*.tgz) tar xzvf $f;;
                *.tar.xz|*.txz) tar xJvf $f;;
                *.zip) unzip $f;;
                *.rar) unrar x $f;;
                *.7z) 7z x $f;;
            esac
        }}

      '';
      tar = ''
        ''${{
            set -f
            mkdir $1
            cp -r $fx $1
            tar czf $1.tar.gz $1
            rm -rf $1
        }}
      '';
      toggle_preview = ''
        %{{
            if [ "$lf_preview" = "true" ]; then
                lf -remote "send $id :set preview false; set ratios 1:5"
            else
                lf -remote "send $id :set preview true; set ratios 1:2:3"
            fi
        }}
      '';
      bulk-rename = ''
        ''${{
            old="$(mktemp)"
            new="$(mktemp)"
            if [ -n "$fs" ]; then
                fs="$(basename -a $fs)"
            else
                fs="$(ls)"
            fi
            printf '%s\n' "$fs" >"$old"
            printf '%s\n' "$fs" >"$new"
            $EDITOR "$new"
            [ "$(wc -l < "$new")" -ne "$(wc -l < "$old")" ] && exit
            paste "$old" "$new" | while IFS= read -r names; do
                src="$(printf '%s' "$names" | cut -f1)"
                dst="$(printf '%s' "$names" | cut -f2)"
                if [ "$src" = "$dst" ] || [ -e "$dst" ]; then
                    continue
                fi
                mv -- "$src" "$dst"
            done
            rm -- "$old" "$new"
            lf -remote "send $id unselect"
        }}
      '';
      on-cd = ''
        &{{
        	# display repository status in your prompt
        	if [ -d .git ] || [ -f .git ]; then
        		branch=$(git branch --show-current 2>/dev/null) || true
        		remote=$(git config --get branch.$branch.remote 2>/dev/null) || true
        		url=$(git remote get-url $remote 2>/dev/null) || true
        		fmt="\033[32;1m%u@%h\033[0m:\033[34;1m%w\033[0m\033[33;1m [GIT BRANCH:> $branch >> $url]\033[0m"
        	elif [ -d .hg ]; then
        		hg=$(hg branch 2>/dev/null) || true
        		fmt="\033[32;1m%u@%h\033[0m:\033[34;1m%w\033[0m\033[33;1m [HG BRANCH:> $hg]\033[0m"
        	elif [ -d .svn ]; then
        		svn=$(svn info 2>/dev/null | awk '/^URL: /{print $2}') || true
        		fmt="\033[32;1m%u@%h\033[0m:\033[34;1m%w\033[0m\033[33;1m [SVN URL:> $svn]\033[0m"
        	else
        		fmt="\033[32;1m%u@%h\033[0m:\033[34;1m%d\033[0m\033[1m%f\033[0m"
        	fi
        	lf -remote "send $id set promptfmt \"$fmt\""
        }}
      '';
    };
    keybindings = {
      "<enter>" = "shell";
      "`" = "!true";
      x = "$$f";
      X = "!$f";
      o = "&mimeopen $f";
      O = "$mimeopen --ask $f";
      a = ":push %mkdir<space>";
      zp = "toggle_preview";
      J = ":updir; set dironly true; down; set dironly false; open";
      K = ":updir; set dironly true; up; set dironly false; open";
    };
    settings = {
      icons = true;
      info = "size";
      shell = "zsh";
      shellopts = "-eu";
      ifs = "\n";
      scrolloff = 10;
      period = 1;
      dircounts = true;
      drawbox = true;
      preview = true;
    };
  };
}
