-- init.lua

-- Set the leader key to space
vim.g.mapleader = ' '

-- Load core settings
require('core.options')
require('core.keymaps')
require('core.settings')

-- Load plugin manager and plugins
require('plugins')

-- Load key mappings
require('mappings')

-- Load LSP configurations
require('lsp')

-- Load which-key configurations
-- require('whichkey')

-- Load utility functions
require('utils.helpers')

