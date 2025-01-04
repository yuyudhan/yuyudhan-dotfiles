-- lua/mappings/leader.lua

local wk = require("which-key")

wk.register({
  f = {
    name = "File",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    e = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
  },
  g = {
    name = "Git",
    s = { "<cmd>Git status<cr>", "Git Status" },
    c = { "<cmd>Git commit<cr>", "Git Commit" },
    g = { "<cmd>LazyGit<CR>", "Lazygit" },
  },
  b = {
    name = "Buffer",
    n = { "<cmd>BufferNext<CR>", "Next Buffer" },
    p = { "<cmd>BufferPrevious<CR>", "Previous Buffer" },
  },
  c = {
    name = "Comment",
    c = { "<cmd>lua require('Comment').toggle()<CR>", "Toggle Comment" },
  },
  l = {
    name = "LSP",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
  },
  -- Add more leader key mappings as needed
}, { prefix = "<leader>" })

