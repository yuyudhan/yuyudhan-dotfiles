-- nvim/nvim/lua/yuyudhan/init.lua

vim.opt.termguicolors = true

-- Load general settings
require('yuyudhan.config')

-- Load keymaps
require('yuyudhan.keymaps')

-- Load plugins
require('yuyudhan.plugins')

-- Load LSP configurations
require('yuyudhan.lsp.config')
require('yuyudhan.lsp.handlers')

-- Load additional configurations
require('yuyudhan.macros')
require('yuyudhan.plugin-config')
require('yuyudhan.reload')

-- Load the custom theme
require('yuyudhan.theme')

