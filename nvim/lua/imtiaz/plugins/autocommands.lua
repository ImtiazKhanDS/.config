return {
	{
		"nvim-lua/plenary.nvim", -- any plugin that is always loaded
		lazy = false,
		config = function()
			local group = vim.api.nvim_create_augroup("MarkdownFrontmatter", { clear = true })

			vim.api.nvim_create_autocmd("BufNewFile", {
				group = group,
				pattern = "*.md",
				callback = function()
					local filename = vim.fn.expand("%:t:r")

					vim.api.nvim_buf_set_lines(0, 0, -1, false, {
						"---",
						'date: "' .. os.date("!%Y-%m-%dT%H:%M:%S.00Z") .. '"',
						"published: true",
						"slug: " .. filename,
						"tags:",
						"time_to_read: 5",
						"title: " .. filename,
						"description:",
						"type: post",
						"---",
						"",
					})
				end,
			})
		end,
	},
}
