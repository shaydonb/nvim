-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set up tab width
vim.opt.relativenumber = true -- sets vim.opt.relativenumber
vim.opt.number = true -- sets vim.opt.number
vim.opt.spell = false -- sets vim.opt.spell
vim.opt.signcolumn = "auto" -- sets vim.opt.signcolumn to auto
vim.opt.wrap = false -- sets vim.opt.wrap
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Set minimum window width to something reasonable
vim.opt.winwidth = 100

-- Disable all animations (unnecessary bloat)
vim.g.snacks_animate = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Ctrl-y/p to yank/paste via vim-local register (won't touch system clipboard)
vim.keymap.set({"n", "v"}, "<C-y>", '"ay')
vim.keymap.set({"n", "v"}, "<C-p>", '"ap')

-- Remind about Ctrl-y/p when using normal yank/paste
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    if vim.v.event.regname == "" or vim.v.event.regname == "+" then
      vim.notify("Yanked to clipboard (Ctrl-y for vim-local)", vim.log.levels.INFO)
    end
  end,
})
vim.keymap.set("n", "p", function() vim.notify("Pasted from clipboard (Ctrl-p for vim-local)", vim.log.levels.INFO) return "p" end, { expr = true })
vim.keymap.set("v", "p", function() vim.notify("Pasted from clipboard (Ctrl-p for vim-local)", vim.log.levels.INFO) return "p" end, { expr = true })
