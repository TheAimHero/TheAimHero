{ pkgs, ... }:
let
  withLua = conf: "lua << EOF\n${conf}\nEOF\n";
  withLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  handlers = withLuaFile ./config/nvim-lspconfig/handlers.lua;

  # lsp config stuff
  defaultLspConfig = name: withLua ''
    require("lspconfig").${name}.setup({
      ---@diagnostic disable-next-line: unused-local
      on_attach = function(c, b)
        Handlers.lsp_keymaps(b)
      end,
      capabilities = Handlers.capabilities,
    })
  '';
  clangdCfg = withLuaFile ./config/nvim-lspconfig/setting/clangd.lua;
  tsserverCfg = withLuaFile ./config/nvim-lspconfig/setting/tsserver.lua;
  lualsCfg = withLuaFile ./config/nvim-lspconfig/setting/lua_ls.lua;
  goplsCfg = withLuaFile ./config/nvim-lspconfig/setting/gopls.lua;
  jsonlsCfg = withLuaFile ./config/nvim-lspconfig/setting/jsonls.lua;
  htmlCfg = withLuaFile ./config/nvim-lspconfig/setting/html.lua;
  yamllsCfg = withLuaFile ./config/nvim-lspconfig/setting/yamlls.lua;
  pythonCfg = withLuaFile ./config/nvim-lspconfig/setting/pyright.lua;
  tailwindCfg = withLuaFile ./config/nvim-lspconfig/setting/tailwindcss.lua;
in
{
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          neocodeium = prev.vimUtils.buildVimPlugin
            {
              name = "neocodeium";
              src = pkgs.fetchFromGitHub {
                owner = "monkoose";
                repo = "neocodeium";
                rev = "4a46f64";
                sha256 = "yQXF9dZSSv8J+l+AYCtfDCnRKR8nBLFfVULWcv01MkY=";
              };
            };
          leetcode = prev.vimUtils.buildVimPlugin
            {
              name = "leetcode";
              src = pkgs.fetchFromGitHub {
                owner = "kawre";
                repo = "leetcode.nvim";
                rev = "02fb2c8";
                sha256 = "YoFRd9Uf+Yv4YM6/l7MVLMjfRqhroSS3RCmZvNowIAo=";
              };
            };
        };
      })
    ];
  };

  home.packages = with pkgs; [
    codeium
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
      ${builtins.readFile ./config/core/options.lua}
      ${builtins.readFile ./config/core/keymaps.lua}
      ${builtins.readFile ./config/core/disable.lua}
      ${builtins.readFile ./config/core/autocommands.lua}
      ${builtins.readFile ./config/core/toggle_stuff.lua}
    '';
    plugins = with pkgs.vimPlugins;[
      nvim-web-devicons
      plenary-nvim
      bufdelete-nvim
      nui-nvim
      vim-fugitive
      {
        plugin = nvim-ts-autotag;
        config = withLua ''require("nvim-ts-autotag").setup({})'';
      }
      telescope-undo-nvim
      substitute-nvim
      telescope-fzf-native-nvim
      friendly-snippets
      cmp-nvim-lsp
      cmp-buffer
      cmp-async-path
      cmp-cmdline
      cmp_luasnip
      SchemaStore-nvim
      nvim-ts-context-commentstring
      {
        plugin = catppuccin-nvim;
        config = withLuaFile ./config/plugins/catppuccin.lua;
      }
      {
        plugin = mini-nvim;
        config = withLuaFile ./config/plugins/mini.lua;
      }
      {
        plugin = telescope-file-browser-nvim;
        config = withLuaFile ./config/plugins/filebrowser.lua;
      }
      {
        plugin = telescope-nvim;
        config = withLuaFile ./config/plugins/telescope.lua;
      }
      {
        plugin = project-nvim;
        config = withLuaFile ./config/plugins/project.lua;
      }
      {
        plugin = eyeliner-nvim;
        config = withLuaFile ./config/plugins/eyeliner.lua;
      }
      {
        plugin = tmux-nvim;
        config = withLuaFile ./config/plugins/tmux.lua;
      }
      {
        plugin = yanky-nvim;
        config = withLuaFile ./config/plugins/substitute-yanky.lua;
      }
      {
        plugin = harpoon;
        config = withLuaFile ./config/plugins/harpoon.lua;
      }
      {
        plugin = trouble-nvim;
        config = withLuaFile ./config/plugins/trouble.lua;
      }
      {
        plugin = statuscol-nvim;
        config = withLuaFile ./config/plugins/statuscol.lua;
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        config = withLuaFile ./config/plugins/treesitter.lua;
      }
      {
        plugin = nvim-cmp;
        config = withLuaFile ./config/completion/cmp.lua;
      }
      {
        plugin = luasnip;
        config = withLuaFile ./config/completion/luasnip.lua;
      }
      {
        plugin = nvim-surround;
        config = withLua ''require("nvim-surround").setup({})'';
      }
      {
        plugin = neocodeium;
        config = withLuaFile ./config/plugins/codeium.lua;
      }
      {
        plugin = diffview-nvim;
        config = withLua "require('diffview').setup({})";
      }
      {
        plugin = leetcode;
        config = withLuaFile ./config/plugins/leetcode.lua;
      }
      {
        plugin = nvim-lspconfig;
        config = builtins.concatStringsSep "\n" [
          handlers
          clangdCfg
          tsserverCfg
          lualsCfg
          goplsCfg
          tailwindCfg
          pythonCfg
          jsonlsCfg
          yamllsCfg
          htmlCfg
          (defaultLspConfig "marksman")
          (defaultLspConfig "nil_ls")
          (defaultLspConfig "golangci_lint_ls")
        ];
      }
      {
        plugin = conform-nvim;
        config = withLuaFile ./config/nvim-lspconfig/conform.lua;
      }
      {
        plugin = nvim-lint;
        config = withLuaFile ./config/nvim-lspconfig/nvim-lint.lua;
      }

    ];
    extraPackages = with pkgs;[
      lua-language-server
      nodePackages.typescript-language-server
      clang
      clang-tools
      nil
      prettierd
      gopls
      vscode-langservers-extracted
      nodePackages.vscode-json-languageserver
      yaml-language-server
      nixpkgs-fmt
      golangci-lint
      pyright
      marksman
      black
      stylua
      eslint_d
    ];
  };
}
