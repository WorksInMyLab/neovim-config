return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup({})

		local builtin = require('telescope.builtin')
		--- Find files
		vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
		--- Find files in current git repo
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		--- Find word
		vim.keymap.set('n', '<leader>pws', function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		--- Find word
		vim.keymap.set('n', '<leader>pWs', function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		--- Grep string
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		--- Help tags
		vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
	end
}
