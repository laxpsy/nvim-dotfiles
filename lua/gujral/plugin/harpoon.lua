local ok, hp = pcall(require, 'harpoon')
if not ok then
	vim.notify("harpoon not found", vim.log.levels.ERROR)
	return
end

hp:setup()

vim.keymap.set("n", "<A-a>", function() hp:list():add() end)
vim.keymap.set("n", "<A-e>", function() hp.ui:toggle_quick_menu(hp:list()) end)

vim.keymap.set("n", "<A-1>", function() hp:list():select(1) end)
vim.keymap.set("n", "<A-2>", function() hp:list():select(2) end)
vim.keymap.set("n", "<A-3>", function() hp:list():select(3) end)
vim.keymap.set("n", "<A-4>", function() hp:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<A-z>", function() hp:list():prev() end)
vim.keymap.set("n", "<A-x>", function() hp:list():next() end)
