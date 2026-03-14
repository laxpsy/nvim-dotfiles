local ok, kanagawa = pcall(require, "kanagawa")
if not ok then
  vim.notify("kanagawa not found", vim.log.levels.ERROR)
  return
end

kanagawa.setup({
  compile = false,
  undercurl = true,

  commentStyle   = { italic = true },
  keywordStyle   = { italic = true },
  statementStyle = { bold = true },
  functionStyle  = {},
  typeStyle      = {},

  transparent = false,
  dimInactive = true,
  terminalColors = true,

  theme = "dragon",

  colors = {
	  theme = {
		  all = {
		  	ui = {
				bg_gutter="none"
			}
		  }
	  }
  },

  overrides = function(colors)
 	return {
		EndOfBuffer = {
			fg = colors.theme.ui.fg_dim,
			bg = "none",
		},
		NonText = {
			fg = colors.theme.ui.fg_dim,
			bg = "none",
		},
	}
  end 
})

vim.cmd.colorscheme("kanagawa-dragon")
