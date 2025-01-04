-- lua/utils/helpers.lua

local M = {}

-- Function to copy relative path of the current file
function M.copy_relative_path()
  local rel_path = vim.fn.expand('%')
  vim.fn.setreg('+', rel_path)
  print("Relative path copied to clipboard: " .. rel_path)
end

-- Function to copy absolute path of the current file
function M.copy_absolute_path()
  local abs_path = vim.fn.expand('%:p')
  vim.fn.setreg('+', abs_path)
  print("Absolute path copied to clipboard: " .. abs_path)
end

return M

