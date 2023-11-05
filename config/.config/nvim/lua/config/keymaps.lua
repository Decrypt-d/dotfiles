local api = require("nvim-tree.api")
local keymap = vim.keymap

local function opts(desc)
  return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

keymap.set('n', '<M-n>',   api.fs.create,                       opts('Create file'))
keymap.set('n', '<M-i>',   api.node.show_info_popup,            opts('Info'))
keymap.set('n', '<M-r>',   api.fs.rename_sub,                   opts('Rename: Omit Filename'))
keymap.set('n', '<M-t>',   api.node.open.tab,                   opts('Open: New Tab'))
keymap.set('n', '<M-v>',   api.node.open.vertical,              opts('Open: Vertical Split'))
keymap.set('n', '<M-s>',   api.node.open.horizontal,            opts('Open: Horizontal Split'))
keymap.set('n', '<M-l>',   api.tree.close,                      opts('Close'))
