return {
 'folke/tokyonight.nvim',
 lazy = false,
 priority = 1000,
 opts = { style = "night" },
 config = function()
	 require("tokyonight").setup({
		 -- Four different styles 'moon', 'storm', 'night' and 'day'
		 style = "night",
		 transparent = "false",
		 terminal_colors = "true",
		 styles = {
			-- Style to be applied to different syntax groups
			-- Value is any vald attr-list value for ':help nvim_set_hl'
			comments = { italic = false },
			keywords = { italic = false },
			sidebars = "dark", -- Style for sidebars
			floats = "dark", -- Style for floating windows
		 },
	 })
 vim.cmd.colorscheme("tokyonight")
 end
}
