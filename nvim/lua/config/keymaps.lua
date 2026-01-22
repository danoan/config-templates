-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local fn = vim.fn
local keymap = vim.keymap

-- Editing
keymap.set("n", "<Leader>w", "<cmd>w<CR>", { desc = "Save current buffer" })
keymap.set("n", "z-", "z=1<enter><enter>", { desc = "Fix spelling mistakes" })
keymap.set("v", "<", "<gv", { desc = "Align left" })
keymap.set("v", ">", ">gv", { desc = "Align right" })

keymap.set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
keymap.set("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
keymap.set("n", "<leader>p", 'o<esc>"+gp', { desc = "Paste from clipboard" })

-- Buffer and windows
keymap.set("n", "<Leader>1", "<cmd>only<CR>", { desc = "Only display the current window" })
keymap.set("n", "gV", "`[V`]", { desc = "Select whole buffer" })
keymap.set("n", "<leader>gV", '`[V`]"+y <c-o>', { desc = "Copy buffer to clipboard" })

keymap.set("n", "<Leader>l", "<cmd>bn<CR>", { desc = "Next buffer" })
keymap.set("n", "<Leader>h", "<cmd>bp<CR>", { desc = "Previous buffer" })
keymap.set("n", "<Leader>q", "<cmd>bp <BAR> bd #<CR>", { desc = "Close buffer" })
keymap.set("n", "<Leader>fd", function()
  vim.cmd("lcd %:h")
  local new_dir = vim.fn.getcwd()
  require("notify")(
    string.format("Working directory has changed to: %s", new_dir),
    "info",
    { title = "Work directory change" }
  )
end, { desc = "Matches working directory with current buffer" })
keymap.set("n", "<Leader>fg", function()
  vim.cmd("lcd -")
  local new_dir = vim.fn.getcwd()
  require("notify")(
    string.format("Switch to previous directory: %s", new_dir),
    "info",
    { title = "Work directory change" }
  )
end, { desc = "Matches working directory with current buffer" })

-- Pane navigation
keymap.set("n", "<M-h>", "<C-w>h", { desc = "Switch to left pane" })
keymap.set("n", "<M-j>", "<C-w>j", { desc = "Switch to right pane" })
keymap.set("n", "<M-k>", "<C-w>k", { desc = "Switch to top pane" })
keymap.set("n", "<M-l>", "<C-w>l", { desc = "Switch to bottom pane" })

-- Navigate display lines
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("v", "j", "gj")
keymap.set("v", "k", "gk")

-- If using a count to move up or down, ignore display lines
keymap.set("n", "k", 'v:count == 0 ? "gk" : "\\<Esc>".v:count."k"', { expr = true })
keymap.set("n", "j", 'v:count == 0 ? "gj" : "\\<Esc>".v:count."j"', { expr = true })

-- Line navigation
keymap.set({ "n", "v" }, "H", "5h", { desc = "Move cursor to the left by 5" })
keymap.set({ "n", "v" }, "J", "5j", { desc = "Move cursor to the bottom by 5" })
keymap.set({ "n", "v" }, "K", "5k", { desc = "Move cursor to the top by 5", remap = true })
keymap.set({ "n", "v" }, "L", "5l", { desc = "Move cursor to the right by 5" })

-- Page navigation
keymap.set("n", "<c-e>", "7<c-e>", { desc = "Smooth page down" })
keymap.set("n", "<c-y>", "7<c-y>", { desc = "Smooth page up" })
keymap.set("v", "<c-e>", "7<c-e>", { desc = "Smooth page down" })
keymap.set("v", "<c-y>", "7<c-y>", { desc = "Smooth page up" })

keymap.set("n", "<Leader>a", "<cmd>noh<CR>", { desc = "Turn off term highlight" })

-- Terminal mode
keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { noremap = true }) -- Exit terminal mode

-- Daniel's Keys
keymap.set("n", "<C-D>c", '<cmd>let @" = expand("%:p")<cr>', { desc = "Copy current file path" })
keymap.set("n", "<C-D>i", "<cmd>e ~/.config/nvim/init.lua<cr>", { desc = "Open main init.lua" })
keymap.set("n", "<C-D>w", "<cmd>ToggleForceWrap<cr>", { desc = "Temporarily ignore formatexpr" })
