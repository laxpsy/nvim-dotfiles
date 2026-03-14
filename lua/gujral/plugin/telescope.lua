local ok, ts = pcall(require, 'telescope')
if not ok then
	vim.notify("telescope not found", vim.log.levels.ERROR)
	return
end

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- telescope.nvim specific remaps
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = "Search git files"})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({ search = vim.fn.input("grep > ")})
end)
vim.keymap.set('n', '<leader>wb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<A-m>', builtin.man_pages, { desc = 'Search man pages' })
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
-- wiki find_files keymap
vim.keymap.set('n', '<leader>sw', function ()
builtin.find_files({
    prompt_title = "Wiki files",
    cwd = '~/Documents/wiki',
    disable_devicons = true,
    find_command = { "rg", "--files", "--sort", "path" },
    file_ignore_patterns = {
      "%.stversions/",
      "%.git/",
    },
    path_display = function(_, path)
      local name = path:match "(.+)%.[^.]+$"
      return name or path
    end,
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace_if(function()
        return action_state.get_selected_entry() == nil
      end, function()
        actions.close(prompt_bufnr)

        local new_name = action_state.get_current_line()
        if new_name == nil or new_name == "" then
          return
        end

        vim.fn["wiki#page#open"](new_name)
      end)

      return true
    end,
  })	
end)


ts.setup{
  defaults = {
    mappings = {
      n = {
        -- To disable a keymap, put [map] = false
        ["<CR>"] = false,
      },
    }
  }
}
