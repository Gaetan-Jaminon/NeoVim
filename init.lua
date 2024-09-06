-- Define the path for Lazy.nvim within the Neovim configuration folder (~/.config/nvim/lazy/lazy.nvim)
-- This ensures Lazy.nvim is stored within the Neovim config instead of the default data path
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
----- 
-- Check if Lazy.nvim is not already installed at the defined path
if not vim.loop.fs_stat(lazypath) then
  -- Clone Lazy.nvim from GitHub if it's not present in the path
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",  -- Clone only the essential parts of the repo
    "https://github.com/folke/lazy.nvim.git",  -- Lazy.nvim repository URL
    "--branch=stable",     -- Use the latest stable release of Lazy.nvim
    lazypath,              -- The installation path for Lazy.nvim
  })
end

-- Prepend Lazy.nvim's path to the runtime path (rtp) to make it available for Neovim
vim.opt.runtimepath:prepend(lazypath)

-- Load general Neovim options from a separate settings file
-- This keeps the init.lua clean and organized
require('settings.options')

-- Load custom key mappings from a separate file to avoid clutter in init.lua
require('settings.keymaps')

-- Load auto commands (e.g., filetype detection) from a dedicated file
-- Helps maintain a modular configuration
require('settings.autocmds')
require('cli.ansible-doc')

-- Setup Lazy.nvim and load all plugins defined in the 'plugins' directory
-- This is where your plugin configurations will live (e.g., Telescope, LSP, etc.)
require("lazy").setup("plugins", {
  root = vim.fn.stdpath("config") .. "/plugins",  -- Install all plugins in ~/.config/nvim/plugins
})

