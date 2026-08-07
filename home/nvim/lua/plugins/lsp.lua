return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      opts.servers.nil_ls = { enabled = false }

      opts.servers.nixd = {
        settings = {
          nixd = {
            nixpkgs = { expr = "import <nixpkgs> { }" },
            options = {
              nixos = {
                expr = '(builtins.getFlake "/home/ilia/dotfiles").nixosConfigurations.desktop.options',
              },
            },
          },
        },
      }

      opts.servers.lua_ls = {}
      opts.servers.zls = {}

      for _, cfg in pairs(opts.servers) do
        if type(cfg) == "table" then
          cfg.mason = false
        end
      end
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = {} },
  },
}
