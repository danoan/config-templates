-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local utils = require('config.utils')
local fn = vim.fn

vim.cmd[[au TermOpen * setlocal nonumber norelativenumber]]
vim.cmd[[au TermOpen * normal i]]


vim.cmd[[ au BufNewFile,BufRead CMakeLists.txt set filetype=cmake ]]

-- Auto-source the nvim config when written
vim.cmd[[ autocmd! BufWritePost $MYVIMRC :source $MYVIMRC ]]


-- Used for filetype specific editing
vim.cmd [[ autocmd! FileType tex,mail,vimwiki,markdown set spell ]]
vim.cmd [[ autocmd! FileType vimwiki,tex,mail,markdown set spelllang=en_us,fr,pt_br,it ]]
vim.cmd [[ autocmd! FileType tex set iskeyword+=:,- ]]

-- Open the help buffer as a right split
-- @todo: Fix unwanted behaviour when opening twice the helper
--        with FzfLua.
vim.cmd[[ autocmd! FileType help wincmd L ]]

-- {{{ Git
-- Git rebase bindings
utils.create_augroup('git_rebase', {
    'FileType gitrebase nnoremap <Leader>p ciwpick<esc>0',
    'FileType gitrebase nnoremap <Leader>r ciwreword<esc>0',
    'FileType gitrebase nnoremap <Leader>e ciwedit<esc>0',
    'FileType gitrebase nnoremap <Leader>s ciwsquash<esc>0',
    'FileType gitrebase nnoremap <Leader>f ciwfixup<esc>0',
    'FileType gitrebase nnoremap <Leader>x ciwexec<esc>0',
    'FileType gitrebase nnoremap <Leader>b ciwbreak<esc>0',
    'FileType gitrebase nnoremap <Leader>d ciwdrop<esc>0',
    'FileType gitrebase nnoremap <Leader>l ciwlabel<esc>0',
    'FileType gitrebase nnoremap <Leader>t ciwreset<esc>0',
    'FileType gitrebase nnoremap <Leader>m ciwmerge<esc>0',
    'FileType gitrebase %s/^pick \\([a-z0-9]\\+\\) drop! /drop \1 /e',
})
-- }}}

-- Remove trailing lines on saving
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.yml", "*.sh", "*.json" },
  command = [[%s/\s\+$//e]],
})

