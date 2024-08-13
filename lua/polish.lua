-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local my_servers = {
  "bashls",
  -- "biome",
  -- "dagger",
  -- "denols",
  "docker_compose_language_service",
  "dockerls",
  -- "efm",
  "gopls",
  "lua_ls",
  "nil_ls",
  "pyright",
  -- "ruff",
  -- "ruff_lsp",
  -- "svelte",
  "tailwindcss",
  "terraformls",
  -- "tflint",
  "tsserver",
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

if not vim.env.NVIM_MAN then
  vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
  vim.api.nvim_create_autocmd("BufRead", { -- Changed from BufReadPre
    desc = "Open neo-tree on enter",
    group = "neotree_autoopen",
    once = true,
    callback = function()
      if not vim.g.neotree_opened then
        vim.cmd "Neotree show"
        vim.g.neotree_opened = true
      end
    end,
  })
end
