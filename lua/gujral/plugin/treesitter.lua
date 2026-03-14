local ok, ts = pcall(require, 'nvim-treesitter')
if not ok then
	vim.notify("nvim-treesitter not found", vim.log.levels.ERROR)
	return
end

local ok, tsc = pcall(require, 'nvim-treesitter.config')
if not ok then
	vim.notify("nvim-treesitter config not found", vim.log.levels.ERROR)
	return
end

-- update note: change only the below three tables.
-- install parsers
-- languages
local language_parsers = {'awk', 'bash', 'c', 'cmake', 'cpp', 'css', 'cuda', 'go', 'javascript',  'jq', 'latex', 'lua', 'markdown', 'markdown_inline', 'nginx', 'passwd', 'python', 'rust', 'sql', 'tsx', 'vim', 'vimdoc', 'zsh'}
-- git-based
local git_parsers = {'diff', 'git_config', 'git_rebase', 'gitcommit', 'gitignore'}
-- tools/frameworks 
local misc_parsers = {'astro', 'comment'}

local all_parsers = {}

for _, parser in ipairs(language_parsers) do 
	table.insert(all_parsers, parser)
end

for _, parser in ipairs(git_parsers) do 
	table.insert(all_parsers, parser)
end

for _, parser in ipairs(misc_parsers) do 
	table.insert(all_parsers, parser)
end

local already_installed_parsers = tsc.get_installed()
local parsers_to_install = vim.iter(all_parsers)
	:filter(function(parser) return not vim.tbl_contains(already_installed_parsers, parser) end)
	:totable()

-- finally, install parsers
ts.install(parsers_to_install)

-- highlighting 
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() 
	vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
	vim.wo[0][0].foldmethod = 'expr'
	vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
