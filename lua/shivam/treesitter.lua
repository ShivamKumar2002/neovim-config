local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local configs = require("nvim-treesitter.configs")

configs.setup {
  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
