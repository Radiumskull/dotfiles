local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')
map('i', '<leader><leader>', '<ESC>')
map('v', '<leader><leader>', '<ESC>')


-- Clear search highlighting with <leader> and c
map('n', '<leader>cc', ':nohl<CR>')

-- Split orientation
map('n', '<leader>ss', ':split<CR>') -- change vertical to horizontal
map('n', '<leader>sv', ':vsplit<CR>') -- change horizontal to vertical

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Alt + {h,j,k,l}
local arrows = {'h', 'j', 'k', 'l'}

for _, v in pairs(arrows) do
  map('n', '<A-' .. v .. '>', '<C-w>' .. v)
  map('t', '<A-' .. v .. '>', '<C-\\><C-n><C-w>' .. v)
  map('i', '<A-' .. v .. '>', '<Esc><C-w>' .. v)
end

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')


-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })
map('t', '<Esc>', '<C-\\><C-n>')

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')
map('i', '<C-n>', '<Esc>:NvimTreeToggle<CR>')
map('t', '<C-n>', '<C-\\><C-n>:NvimTreeToggle<CR>')

map('n', '<leader>f', ':NvimTreeRefresh<CR>')
map('n', '<leader>n', ':NvimTreeFocus<CR>')
map('t', '<leader>n', '<C-\\><C-n>:NvimTreeFocus<CR>')

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fb', ':Telescope live_grep<cr>')
map('n', '<leader>fg', ':Telescope buffers<cr>')
map('n', '<leader>fh', ':Telescope help_tags<cr>')
map('n', '<leader>fa', ':Telescope lsp_document_symbols<cr>')

-- Open file
map('n', 'gf', ':edit <cfile><cr>')

-- Move selected line / block of text in visual mode
map("v", "K", ":move '<-2<CR>gv-gv", silent)
map("v", "J", ":move '>+1<CR>gv-gv", silent)

-- Keep visual mode indenting
map("v", "<", "<gv", silent)
map("v", ">", ">gv", silent)

-- Save file by CTRL-S
map("n", "<C-s>", ":w<CR>", silent)
map("i", "<C-s>", "<ESC> :w<CR>", silent)

-- Open Term in a New Tab
map("n", "<C-T>", ":tabnew<CR>:term<CR>i")


-- LSP
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", silent)
map("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
map("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", silent)
map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", silent)
map("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", silent)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
map("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
map("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", silent)
map("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", silent)

-----------------------------------------------------------
-- Tab Switching
-----------------------------------------------------------
map('n', 'tt', ':tabedit<CR>')
map('n', 'tn', ':tabn<CR>')
map('n', 'tp', ':tabp<CR>')
map('n', '<A-t>', ':tabn<CR>')
map('t', '<A-t>', '<C-\\><C-n>:tabn<CR>')
map('n', 'tq', ':tabclose<CR>')
map('n', 'ta', ':tabonly<CR>')

for i = 10,1,-1
do
  map('n', '<A-' .. i .. '>', i .. 'gt')
  map('i', '<A-' .. i .. '>', '<Esc>' .. i .. 'gt')
  map('t', '<A-' .. i .. '>', '<C-\\><C-n>' .. i .. 'gt')
end

map('n', '<leader>ec', ':edit ~/.config/nvim/<CR>')
