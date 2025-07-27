return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = { enabled = false, auto_trigger = true },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
