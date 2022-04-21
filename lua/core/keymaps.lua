local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "


-- Map Esc to kk
map('i', 'jj', '<Esc>')

map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>')            -- open/close
--map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
--map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Telescope
map('n', '<C-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>")
map('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files()<cr>")
map('n', '<leader>g', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map('n', '<leader>b', "<cmd>lua require('telescope.builtin').buffers()<cr>")
map('n', '<leader>s', "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")
map('n', '<leader>t', "<cmd>lua require('telescope.builtin').treesitter()<cr>")

-- Buffers
map('n', '<leader>bd', "<cmd>lua require('mini.bufremove').delete()<cr>")

-- Lazygit
map('n', '<leader>gg', "<cmd>LazyGit<cr>")
