-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

local my_servers = {
  "bashls",
  "biome",
  -- "dagger",
  "denols",
  "docker_compose_language_service",
  "dockerls",
  -- "efm",
  "gopls",
  "lua_ls",
  "nil_ls",
  "pyright",
  "ruff",
  "ruff_lsp",
  -- "svelte",
  "tailwindcss",
  "terraformls",
  -- "tflint",
  -- "tsserver",
  -- "volar",
  "yamlls",
}
if vim.env.NIX_STORE then
  _G.ensure_installed = {}
  _G.already_installed = my_servers
else
  _G.ensure_installed = my_servers
  _G.already_installed = {}
end

require "lazy_setup"
require "polish"
