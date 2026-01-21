-- This file overrides options of default plugins in lazy.nvim
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", false },
            { "oo", vim.lsp.buf.hover },
          },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>f1",
        function()
          require("telescope.builtin").find_files({ cwd = "~", prompt = "Home" })
        end,
        desc = "Find files from the home directory",
      },
      {
        "<leader>f2",
        function()
          require("telescope.builtin").find_files({ cwd = "~/Projects", prompt = "Projects" })
        end,
        desc = "Find files from the ~/Projects",
      },
    },
  },
}
