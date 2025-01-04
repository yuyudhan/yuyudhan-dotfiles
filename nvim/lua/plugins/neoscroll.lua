-- lua/plugins/neoscroll.lua

require('neoscroll').setup({
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
             '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
  hide_cursor = true,  -- Hide cursor while scrolling
  stop_eof = true,     -- Stop at the end of file when scrolling downwards
  use_local_scrolloff = false, -- Use the 'scrolloff' option instead
  respect_scrolloff = false,   -- Disable 'scrolloff' when scrolling
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing_function = "quadratic", -- Default easing function
  pre_hook = nil, -- Function to run before the scrolling animation starts
  post_hook = nil, -- Function to run after the scrolling animation ends
})

