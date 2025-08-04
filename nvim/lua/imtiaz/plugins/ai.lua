return {
	{
		"olimorris/codecompanion.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
			"ravitemer/mcphub.nvim",
		},
		config = function()
			require("codecompanion").setup({
				adapters = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							name = "ollama",
							schema = {
								model = {
									default = "qwen3:4b", -- Specify your preferred Ollama model
								},
							},
						})
					end,
				},
				strategies = {
					chat = {
						adapter = "ollama", -- Use Ollama for chat
						tools = {
							["mcp"] = {
								callback = require("mcphub.extensions.codecompanion"),
								description = "Call tools and resources from the MCP Servers",
								opts = {
									requires_approval = true,
								},
							},
						},
					},
					inline = {
						adapter = "ollama", -- Optionally use Ollama for inline suggestions
					},
				},
				opts = {
					log_level = "DEBUG", -- Enable debug logging for troubleshooting
				},
				extensions = {
					mcphub = {
						callback = "mcphub.extensions.codecompanion",
						opts = {
							-- MCP Tools
							make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
							show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
							add_mcp_prefix_to_tool_names = true, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
							show_result_in_chat = true, -- Show tool results directly in chat buffer
							format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
							-- MCP Resources
							make_vars = true, -- Convert MCP resources to #variables for prompts
							-- MCP Prompts
							make_slash_commands = true, -- Add MCP prompts as /slash commands
						},
					},
				},
			})
		end,
	},
}
