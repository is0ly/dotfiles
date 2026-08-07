return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      provider = "openai_fim_compatible",
      n_completions = 1,
      context_window = 512,
      provider_options = {
        openai_fim_compatible = {
          api_key = "TERM",
          name = "Ollama",
          end_point = "http://localhost:11434/v1/completions",
          model = "qwen2.5-coder:14b-base",
        },
      },
      virtualtext = {
        auto_trigger_ft = { "zig", "nix", "lua" },
        keymap = {
          accept = "<A-a>",
          dismiss = "<A-e>",
        },
      },
    },
  },
}
