print("inside init.lua")         -- prints in status line

require("config.startup")       -- all my vim startup options
require("config.options")       -- all my vim options
require("config.plugins")       -- call lazy package manager
                                -- lazy must be called before anything else
                                -- because things are installed through lazy
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


