-- nvim/init.lua

vim.opt.termguicolors = true

-- Load general settings
require('core.options')
require('core.autocommands')

-- Load keymaps
require('core.keymaps')

-- Load plugins
require('plugins')

-- Load LSP configurations
require('lsp.config')
require('lsp.handlers')

-- Load additional configurations
require('utils/helpers')

-- Load the custom theme
require('core.options')
require('core.keymaps')
require('core')

