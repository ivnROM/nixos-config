{
  lib,
  config,
  ...
}:

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
      
      vim.clipboard = {
        enable = true;
        registers = "unnamedplus";
        providers.wl-copy.enable = true; 
      };

      vim.diagnostics = {
        enable = true;
      };

      vim.visuals = {
        cellular-automaton.enable = true;
        indent-blankline.enable = true;
        nvim-cursorline.enable = true;
      };

      vim.mini = {
        git.enable = true;
        move.enable = true;
        pairs.enable = true;
        surround.enable = true;
      };

      vim.lsp = {
        enable = true;
        inlayHints.enable = true;
        lightbulb.enable = true;

        mappings = {
          codeAction = "<leader>la";
          format = "<leader>lf";
          goToDeclaration = "gD";
          goToDefinition = "gd";
          renameSymbol = "<leader>r";
        };
      };

      vim.languages = {
        enableTreesitter = true;
        bash.enable = true;
        css = {
          enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };
        html = {
          enable = true;
          treesitter = {
            enable = true;
            autotagHtml = true;
          };
        };
        nix = {
          enable = true;
          treesitter.enable = true;
          lsp = {
            enable = true;
            server = "nil";
          };
          format = {
            enable = true;
            type = "nixfmt";
          };
        };
        markdown = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
          treesitter.enable = true;
          extraDiagnostics.enable = true;
          extensions.markview-nvim.enable = true;
        };
        python = {
          enable = true;
        };
        sql = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
        };
        ts = {
          enable = true;
          lsp.enable = true;
          format.enable = true;
        };
        clang = {
          enable = true;
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
      vim.snippets.luasnip = {
        enable = true;
        providers = ["blink-cmp"];
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
        {
          mode = "n";
          key = ",";
          action = ":noh<CR>";
          desc = "Stop highlighting findings";
        }
      ];
    };
  };
}
