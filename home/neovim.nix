{ ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    initLua = ''
      local nix_format_group =
        vim.api.nvim_create_augroup("NixFormatOnSave", { clear = true })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = nix_format_group,
        pattern = "*.nix",
        callback = function()
          vim.cmd("silent keepjumps %!nixfmt -")
        end,
      })
    '';
  };
}
