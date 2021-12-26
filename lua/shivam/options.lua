local options = {
    number = true,                -- Enable numbered lines
    numberwidth = 4,              -- Set number column width
    expandtab = true,             -- Convert tabs to spaces
    smartindent = true,           -- Enable smart indenting
    shiftwidth = 4,		  -- Number of spaces inserted for each indentation
    tabstop = 4,		  -- Number of spaces inserted for each tab
    smarttab = true,		  -- Enable smart tabbing
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
