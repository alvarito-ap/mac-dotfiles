local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fo", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})

--vim.api.nvim_set_keymap("n", "<leader>e", "Telescope file_browser", { noremap = true })
vim.keymap.set(
    "n",
    "<leader>e",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    {noremap = true }
)

vim.keymap.set("n", "<leader>q", function() vim.cmd "q" end, {})
vim.keymap.set("n", "<leader>bs", function() vim.cmd "w" end, {})
vim.keymap.set("n", "<leader>bf", function() vim.lsp.buf.format() end, {})
vim.keymap.set("n", "<leader>bx", function() vim.cmd "bd" end, {})
vim.keymap.set("n", "<leader>bw", function() vim.cmd "%bd|e#" end, {})
vim.keymap.set("n", "<C-i>", function() vim.cmd "bprev" end, {})
vim.keymap.set("n", "<C-o>", function() vim.cmd "bnext" end, {})



local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<A-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<A-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<A-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<A-l>", function() ui.nav_file(4) end)
