-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable LazyVim auto format
vim.g.autoformat = true

-- LazyVim picker to use.
-- Can be one of: telescope, fzf
-- Leave it to "auto" to automatically use the picker
-- enabled with `:LazyExtras`
vim.g.lazyvim_picker = "auto"

-- Set to false to disable `vim.lsp.inlay_hint` if you don't want them
-- You can also toggle them with <leader>uh (see keymaps.lua)
vim.g.lazyvim_inlay_hints = false

-- Root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
-- mini.animate will also be disabled.
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

-- Show the current document symbols location from Trouble in lualine
-- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
vim.g.trouble_lualine = true

-- Select the pick backend. Defaults to auto.
-- Pick auto will use the first available picker, telescope -> fzf -> snacks
-- Leave this unset if using an extras that switches the picker
vim.g.lazyvim_picker = "auto"

-- Enable the LazyVim statuscolumn.
-- To customize, copy `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/ui.lua`
-- and modify the `statuscolumn` option.
vim.g.lazyvim_statuscolumn = {
  folds_open = false, -- show fold sign when fold is open
  folds_githl = false, -- highlight fold sign with git sign color
}

-- Optionally setup the terminal to use
-- This sets `vim.o.shell` and is also used by some plugins that need a terminal
-- It's recommended to use `pwsh` on Windows
vim.g.lazyvim_terminal = {
  shell = vim.o.shell,
  size = { width = 0.9, height = 0.9 },
  border = "rounded",
}

local opt = vim.opt

-- Session Management
opt.sessionoptions:append("globals") -- Store global variables in the session

-- Undo
opt.undofile = true
opt.undolevels = 10000

-- Enable mouse support
opt.mouse = "a"

-- UI
opt.termguicolors = true
opt.pumblend = 10
opt.pumheight = 10

-- Editor UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Clipboard
if vim.fn.has("unnamedplus") then
  opt.clipboard = "unnamedplus"
end

-- Performance
opt.updatetime = 200
opt.timeoutlen = 300

-- Disable some builtin providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0