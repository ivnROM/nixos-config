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

      vim.git = {
        enable = true;
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

      vim.telescope.enable = true;
      vim.autocomplete.nvim-cmp.enable = true;
    };
  };
}
