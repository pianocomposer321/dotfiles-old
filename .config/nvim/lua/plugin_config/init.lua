local M = {}

M.nvimtree = require("plugin_config.nvimtree").config
M.tmuxnavigator = require("plugin_config/tmuxnavigator").config
M.barbar = require("plugin_config/barbar").config
M.lspconfig = require("plugin_config/lspconfig").config
M.telescope = require("plugin_config/telescope").config

return M
