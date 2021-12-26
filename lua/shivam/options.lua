local options = {
    number = true,                -- Enable numbered lines
    numberwidth = 4,              -- Set number column width
    expandtab = true,             -- Convert tabs to spaces
    smartindent = true,           -- Enable smart indenting
    shiftwidth = 4,		  -- Number of spaces inserted for each indentation
    tabstop = 4,		  -- Number of spaces inserted for each tab
    smarttab = true,		  -- Enable smart tabbing
    background = "dark",	  -- Use dark background
    termguicolors = true,	  -- Enable terminal gui colors
    splitbelow = true,            -- Force all horizontal splits to go below current window
    splitright = true,            -- Force all vertical splits to go to the right of current window
    cursorline = true,            -- Highlight current line
    fileencoding = "utf-8",       -- Encoding of file
    clipboard = "unnamedplus",    -- Allow access to system clipboard
    undofile = true,		  -- Enable persistent undo
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
