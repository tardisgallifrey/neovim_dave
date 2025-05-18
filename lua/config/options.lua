-- Dave's vim settings from vrhho video

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true              -- use line numbers
vim.o.relativenumber = true      -- use relative line numbers
vim.o.tabstop = 3                -- set tab stop spaces
vim.o.shiftwidth = 4             -- set tab stops for all other tabs
vim.opt.splitbelow = true        -- does all splitscreen below editor
vim.opt.splitright = true        -- does all splitscreen to the right of editor
vim.opt.wrap = false             -- turns off line wrapping
vim.opt.expandtab = true         -- makes all tabs into spaces
vim.opt.clipboard = "unnamedplus"   -- synchronizes vim copy register with OS clipboard
vim.opt.scrolloff = 999          -- centers screen scrolling
vim.opt.virtualedit = "block"    -- sets visual block to virtual editing
vim.opt.inccommand = "split"     -- sets increment command to a split screen (preview changes)
vim.opt.ignorecase = true        -- ignore case in vim commands
vim.opt.termguicolors = true     -- use terminal gui colors instead of vim colors

-- Set up diagnostics
vim.diagnostic.config({
    virtual_lines = true,

})
