{ pkgs, config, lib, inputs, ... }:

{

  programs.nvf = {
    enable = true;

    settings = {
      vim.theme = {
        enable = true;
        style = "dark";
      };

      vim.viAlias = true;
      vim.vimAlias = true;

      vim.lsp = {
        enable = true;
      };

      vim.languages = {
        enableTreesitter = true;
        nix.enable = true;
      };

      vim.statusline.lualine = {
        enable = true;
        theme = lib.mkForce "auto";
      };
      vim.telescope.enable = true;
      vim.autocomplete.nvim-cmp.enable = true;

    };
  };
}
