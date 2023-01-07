local fn = vim.fn
local keymap = vim.keymap

-- To fix spelling mistakes
keymap.set('n', 'z-', 'z=1<enter><enter>')

-- Open vim configuration file
keymap.set('n', '<Leader>fi', '<cmd>e $MYVIMRC<CR>')

-- Changes the working directory of the current window to match the one of the current buffer 
keymap.set('n', '<Leader>fd', '<cmd>lcd %:h<CR>')

-- Go to next error
keymap.set('n', '<down>', '<cmd>cnext<CR>')

-- Go to previous error
keymap.set('n', '<up>', '<cmd>cprevious<CR>')

-- Filetype, requires FT command defined for FzfLua
keymap.set('n', '<Leader>m', '<cmd>FT<CR>')

-- Quit the current buffer
keymap.set('n', '<Leader>k', '<cmd>q<CR>')

-- Make the current window the only one being displayed
keymap.set('n', '<Leader>1', '<cmd>only<CR>')

-- Split windows horizontally
keymap.set('n', '<Leader>2', '<cmd>split<CR>')

-- Split windows vertically
keymap.set('n', '<Leader>3', '<cmd>vsplit<CR>')

-- Select whole buffer
keymap.set('n', 'gV', '`[V`]')

-- Copy whole buffer to system clipboard
keymap.set('n', '<leader>gV', '`[V`]"+y <c-o>')

-- Performs a regular search
keymap.set('n', '<leader>d', '/\\v', {silent = false})

-- Get out of input mode using likely more reachable keys during editing
keymap.set('i', 'kj', '<esc>')

-- Don't know what it does
keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Switch to left pane
keymap.set('n', '<M-h>', '<C-w>h')

-- Switch to right pane
keymap.set('n', '<M-j>', '<C-w>j')

-- Switch to top pane
keymap.set('n', '<M-k>', '<C-w>k')

-- Switch to bottom pane
keymap.set('n', '<M-l>', '<C-w>l')

-- Navigate display lines
keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')
keymap.set('v', 'j', 'gj')
keymap.set('v', 'k', 'gk')

-- If using a count to move up or down, ignore display lines
keymap.set('n', 'k', 'v:count == 0 ? "gk" : "\\<Esc>".v:count."k"', {expr = true})
keymap.set('n', 'j', 'v:count == 0 ? "gj" : "\\<Esc>".v:count."j"', {expr = true})

keymap.set({'n', 'v'}, 'H', '5h')
keymap.set({'n', 'v'}, 'J', '5j')
keymap.set({'n', 'v'}, 'K', '5k')
keymap.set({'n', 'v'}, 'L', '5l')
keymap.set('n', '<c-j>', 'J')
keymap.set('n', '<c-h>', 'H')
keymap.set('n', '<c-l>', 'L')
keymap.set('n', '<c-m>', 'M')

keymap.set('n', '<c-e>', '7<c-e>')
keymap.set('n', '<c-y>', '7<c-y>')
keymap.set('v', '<c-e>', '7<c-e>')
keymap.set('v', '<c-y>', '7<c-y>')

keymap.set('n', 'Y', 'y$')

-- Saving
keymap.set('n', '<Leader>w', '<cmd>w<CR>')

-- Copy to clipboard
keymap.set('v', '<leader>y', '"+y')
keymap.set('n', '<leader>y', '"+y')
keymap.set('n', '<leader>p', 'o<esc>"+gp')

-- Align blocks of texte and keep them selected
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

keymap.set('n', '<Leader>l', '<cmd>bn<CR>')
keymap.set('n', '<Leader>h', '<cmd>bp<CR>')

-- Close the current buffer and move to the previous one
keymap.set('n', '<Leader>q', '<cmd>bp <BAR> bd #<CR>')

-- Turn off highlight after search
keymap.set('n', '<Leader>a', '<cmd>noh<CR>')

-- Resize window
keymap.set('n', '<c-up>', '<c-w>3+')
keymap.set('n', '<c-down>', '<c-w>3-')
keymap.set('n', '<c-left>', '<c-w>3<')
keymap.set('n', '<c-right>', '<c-w>3>')

-- {{{ Pasting without replacing register
local restore_reg = nil
_G.restore_register = function()
    fn.setreg('"', restore_reg)
    return ''
end

keymap.set('v', 'p', function ()
    restore_reg = fn.getreg('"')
    return "p@=v:lua.restore_register()\"
end, {expr = true})
-- }}}

keymap.set('i', '<s-Tab>', function () return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>" end, {expr = true})
keymap.set('i', '<Tab>', function () return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>" end, {expr = true})

--Daniels configuration

--NvimTreeToogle
keymap.set('n','<leader>F','<cmd>NvimTreeFindFile<CR>')

--Black formatting
keymap.set('n','<leader>f','<cmd>call Black()<cr>')

--Open terminal in a vertical split
keymap.set('n', '<leader>tv','<cmd>vsplit<cr><cmd>term<cr>')

--Open terminal in a horizontal split
keymap.set('n', '<leader>th','<cmd>split<cr><cmd>term<cr>')

--Align Markdown tables
--Is not working. Need to discover how. Doing manually works.
-- keymap.set('v', '<leader>|',"<cmd>'<,'>EasyAlign*|<cr>")
-- vim.cmd('au FileType markdown vmap <Leader>| :EasyAlign*|<Enter>')

