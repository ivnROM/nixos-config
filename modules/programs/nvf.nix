{ pkgs, config, lib, inputs, ... }:

{
  stylix.targets.nvf = {
    enable = true;
    transparentBackground = true;
  };

  programs.nvf = {
    enable = true;

    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;

      vim.binds = {
        #whichKey.enable = true;
      };

      vim.mini = {
        git.enable = true;
        indentscope.enable = true;
        move.enable = true;
        pairs.enable = true;
        surround.enable = true;
      };

      vim.lsp = {
        enable = true;
      };

      vim.languages = {
        enableTreesitter = true;
        nix.enable = true;
        bash.enable = true;
        markdown = {
          enable = true;
          extensions.render-markdown-nvim.enable = true;
        };
        python = {
          enable = true;
        };
        clang = {
          enable = true;
          lsp.enable = true;
          treesitter.enable = true;
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

      vim.terminal.toggleterm = {
        enable = true;
        lazygit.enable = true;
      };

      vim.telescope = {
        enable = true;
        mappings = {
          findFiles = "<leader>ff";
          liveGrep = "<leader>fg";       
          findProjects = "<leader>fp";       

        };
      };
      vim.treesitter.enable = true;
      vim.autocomplete.blink-cmp.enable = true;

      vim.keymaps = [
        {
          # guardar archivo
          mode = "n";
          key = "<leader>fs";
          action = ":w<CR>";
          desc = "Save file";
        }
        {
          # salir y guardar
          mode = "n";
          key = "<leader>fq";
          action = ":wq<CR>";
          desc = "Save and quit";
        }
      ];
    };
  };
}
