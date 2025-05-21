{ pkgs, config, lib, inputs, ... }:

{

  programs.nvf = {
    enable = true;

    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;

      vim.binds = {
        whichKey.enable = true;
      };

      vim.mini = {
        files.enable = true;
        git.enable = true;
        indentscope.enable = true;
        move.enable = true;
        pairs.enable = true;
        pick.enable = true;
        surround.enable = true;
      };

      vim.lsp = {
        enable = true;
      };

      vim.languages = {
        enableTreesitter = true;
        nix.enable = true;
        markdown = {
          enable = true;
          extensions.render-markdown-nvim.enable = true;
        };
      };

      vim.statusline.lualine = {
        enable = true;
        theme = lib.mkForce "auto";
      };

      vim.options = {
        tabstop = 2;
        shiftwidth = 2;
      };

      vim.theme = {
        enable = true;
        style = "dark";
      };

      #vim.telescope.enable = true;
      vim.autocomplete.nvim-cmp.enable = true;

      vim.keymaps = [
        {
          # buscar archivo
          mode = "n";
          key = "<leader>ff";
          action = "lua MiniPick.builtin.files()";
        }
        {
          # live grep
          mode = "n";
          key = "<leader>fg";
          action = "lua MiniPick.builtin.grep_live()";
        }
        {
          # cambiar buffer
          mode = "n";
          key = "<leader>fb";
          action = "lua MiniPick.builtin.buffers()";
        }
        {
          # buscar en ayuda
          mode = "n";
          key = "<leader>fh";
          action = "lua MiniPick.builtin.help()";
        }
        {
          # archivos recientes
          mode = "n";
          key = "<leader>fr";
          action = "lua MiniPick.builtin.oldfiles()";
        }
      ];
    };
  };
}
