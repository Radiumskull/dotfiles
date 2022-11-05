local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'ggandor/leap.nvim'
  use 'glepnir/dashboard-nvim'

  use 'folke/tokyonight.nvim'
  use 'xiyaowong/nvim-transparent'
  use 'nvim-tree/nvim-web-devicons'
  use 'lewis6991/gitsigns.nvim'

  --- Commenting -----------------------------
  use 'tpope/vim-commentary'
  --------------------------------------------


  --- Telescope ------------------------------
  use { 'ibhagwan/fzf-lua' }
 use {                                                        
   'nvim-telescope/telescope.nvim',                           
   requires = {                                               
     {'nvim-lua/popup.nvim'},                                 
     {'nvim-lua/plenary.nvim'},                               
     {'nvim-telescope/telescope-fzf-native.nvim', run="make"},
     {'nvim-telescope/telescope-symbols.nvim'},               
   },                                                         
 }     
  --- Treesitter LSP and Formatting ---
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'mhartington/formatter.nvim'
  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {}
    end
  }
  ---------------------------------------------------------

  --- Snippets and Recommendation----
  use{
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'onsails/lspkind.nvim',
    'hrsh7th/cmp-path',
    'hrsh7th/vim-vsnip'
  }
  use 'alvan/vim-closetag'

  -----------------

  use 'tpope/vim-surround'
  use 'kyazdani42/nvim-tree.lua'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'
  use 'jiangmiao/auto-pairs'

  use 'nvim-lualine/lualine.nvim'


  use 'mxw/vim-jsx'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'gregsexton/matchtag'


end)
