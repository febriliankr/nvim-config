-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
local function map(mode, lhs, rhs, opts)
    local options = {
        noremap = true,
        silent = true
    }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to space
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Fast saving with <leader> and s in normal mode
map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':wqa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>') -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>') -- refresh

-- Telescope
map('n', '<C-o>', ':Telescope buffers<cr>')
map('n', '<C-p>', ':Telescope find_files prompt_prefix=❱❱<cr>')
map('n', '<C-g>', ':Telescope git_files<cr>')
map('n', '<C-f>', ':Telescope live_grep<cr>')

map("n", "<leader><leader>", ":Telescope builtin<cr>", {
    desc = "Telescope: Open builtin function"
})

require('nvim_comment').setup({
    line_mapping = "<leader>cl",
    operator_mapping = "<leader>c",
    comment_chunk_text_object = "ic"
})

map("n", "gtj", ":GoAddTag json<cr>")
map("n", "gtd", ":GoAddTag db<cr>")
map("n", "gtx", ":GoRmTag<cr>")
