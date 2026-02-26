-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--  function example
-- vim.keymap.set("n", "jk", function()
-- 	print("hello")
-- end)

-- Clear highlights on search when pressing
vim.keymap.set({ "n", "v" }, "<C-h>", "<cmd>nohlsearch<CR>")

-- Keep pasted text
vim.keymap.set("v", "p", "pgvy")

-- Escape with C-j
vim.keymap.set({ "i", "v" }, "<C-j>", "<Esc>")

-- Save with space w
vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>")


-- Switch to previous buffer
vim.keymap.set("n", "<leader><leader>", "<C-^>")

-- For some reason yy and space is super slow and seems like it is waiting on another key
-- Explicitly mapping here
vim.keymap.set("n", "yy", "yy")
vim.keymap.set("t", "<space>", "<space>")

-- Jump to beginning and end of lines on home row
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "g_")
vim.keymap.set({ "n", "o" }, "cH", "c^")
vim.keymap.set({ "n", "o" }, "cL", "cg_")
vim.keymap.set({ "n", "o" }, "yH", "y^")
vim.keymap.set({ "n", "o" }, "yL", "yg_")

-- Keep in top of screen when navigating
vim.keymap.set("n", "n", "nzt")
vim.keymap.set("n", "N", "Nzt")
vim.keymap.set("n", "*", "*zt")
vim.keymap.set("n", "g*", "g*zt")
vim.keymap.set("n", "#", "#zt")
vim.keymap.set("n", "<C-u>", "<C-u>zt")
vim.keymap.set("n", "<C-d>", "<C-d>zt")

-- Move lines up and down
vim.keymap.set({ "n", "v", "x" }, "J", "<cmd>:m .+1<CR>")
vim.keymap.set({ "n", "v", "x" }, "K", "<cmd>:m .-2<CR>")

-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- allow commands without having to hit shift
vim.keymap.set("n", ";", ":")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Markview toggle
vim.keymap.set("n", "<leader>mp", "<cmd>Markview toggle<CR>", { desc = "Toggle [M]arkdown [P]review" })
