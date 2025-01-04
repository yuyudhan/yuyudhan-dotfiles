-- lua/plugins/init.lua

-- Ensure Lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize Lazy.nvim with your plugins
require('lazy').setup({
  -- LSP and Autocompletion
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.nvim-lspconfig')
    end,
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
    lazy = false, -- Load immediately
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require('plugins.nvim-cmp')
    end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('plugins.nvim-treesitter')
    end,
  },

  -- File Explorer
  {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('plugins.nvim-tree')
    end,
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('plugins.lualine')
    end,
  },

  -- FZF and FZF.vim
  {
    'junegunn/fzf',
    run = './install --bin',
  },
  {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf' },
  },

  -- Which-Key
  {
    'folke/which-key.nvim',
    config = function()
      require('plugins.whichkey')
    end,
  },

  -- Neoscroll
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('plugins.neoscroll')
    end,
  },

  -- Comment.nvim
  {
    'numToStr/Comment.nvim',
    config = function()
      require('plugins.comment')
    end,
  },

  -- Lazygit
  {
    'kdheepak/lazygit.nvim',
    config = function()
      require('plugins.lazygit')
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}, {
  -- Lazy.nvim options (optional)
  defaults = {
    lazy = true, -- Enable lazy loading by default
    version = false, -- Always use the latest git commit
  },
  ui = {
    border = 'rounded',
  },
})


