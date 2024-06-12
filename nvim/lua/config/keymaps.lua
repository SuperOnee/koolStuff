-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Remove the current buffer and displaying dashboard when no buffer is opened
function REMOVE_CURRENT_BUFFER()
  LazyVim.ui.bufremove()
  local fallback_name = vim.api.nvim_buf_get_name(0)
  local fallback_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local fallback_on_empty = fallback_name == '' and fallback_ft == ''

  if fallback_on_empty then
    vim.cmd('Dashboard')
  end
end

-- Deleting without copying, cut with X
keymap.set('n', 'x', '"_x')
keymap.set('n', 'c', '"_c')
keymap.set('n', 'C', '"_C')
keymap.set('v', 'c', '"_c')
keymap.set('v', 'C', '"_C')
keymap.set('n', 'd', '"_d')
keymap.set('n', 'D', '"_D')
keymap.set('v', 'D', '"_D')
keymap.set('v', 'd', '"_d')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Split windows
keymap.set('n', 'ss', ':split<CR>', opts)
keymap.set('n', 'sv', ':vsplit<CR>', opts)

-- Scroll
keymap.set('n', '<C-d>', '9jzz', { remap = true })
keymap.set('n', '<C-u>', '9kzz', { remap = true })
keymap.set('n', 'G', 'Gzz', { remap = true })

-- Window Navigation
keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>', { remap = true, silent = true })
keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>', { remap = true, silent = true })
keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>', { remap = true, silent = true })
keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>', { remap = true, silent = true })

-- Buffers
keymap.set('n', '<leader>q', REMOVE_CURRENT_BUFFER, { desc = 'Delete current buffer' })

keymap.set('n', '<leader>qa', function()
  vim.cmd('BufferLineCloseOthers')
  REMOVE_CURRENT_BUFFER()
end, { desc = 'Delete all buffers' })

-- Save file
keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

-- Map gj gk
keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })

-- Select all text in current file
keymap.set('n', '<C-a>', 'gg<S-v>G')
