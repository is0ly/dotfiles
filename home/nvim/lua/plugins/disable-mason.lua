return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.nil_ls = { mason = false }
      opts.servers.lua_ls = { mason = false }
      opts.servers.zls = { mason = false }

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
