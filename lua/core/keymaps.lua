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

-- Tab bar
map('n', '<A-Left>', "<cmd>BufferPrevious<cr>")
map('n', '<A-Right>', "<cmd>BufferNext<cr>")
map('n', '<A-<>', '<cmd>BufferMovePrevious<CR>')
map('n', '<A->>', ' <cmd>BufferMoveNext<CR>')
map('n', '<A-1>', '<cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<cmd>BufferGoto 7<CR>')
map('n', '<A-8>', '<cmd>BufferGoto 8<CR>')
map('n', '<A-9>', '<cmd>BufferGoto 9<CR>')

map('n', '<A-q>', "<cmd>BufferClose<CR>")
map('n', '<A-c>', "<cmd>BufferCloseAllButCurrent<cr>")

-- reloading config
map('n', '<Leader>r', '<cmd>lua ReloadConfig()<cr>')

-- LSP
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
