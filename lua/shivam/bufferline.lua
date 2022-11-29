local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
options = {
  numbers = function(opts)
    return string.format("%s", opts.ordinal)
  end,
  indicator = {
	  style = "icon",
	  icon = "▎",
  },
  buffer_close_icon = "",
  modified_icon = "●",
  close_icon = "",
  left_trunc_marker = "",
  right_trunc_marker = "",
  max_name_length = 15,
  max_prefix_length = 10, -- prefix used when a buffer is de-duplicated
  tab_size = 20,
  diagnostics = "nvim_lsp",
  diagnostics_indicator = function(_, _, diagnostics_dict, _)
    local s = " "
    for e, n in pairs(diagnostics_dict) do
      local sym = e == "error" and "  " or (e == "warning" and "  " or "  ")
      s = s .. n .. sym
    end
    return s
  end,
  -- NOTE: this will be called a lot so don't do any heavy processing here
  custom_filter = function(buf_number)
    if vim.bo[buf_number].filetype ~= "dashboard" then
      return true
    end
  end,
  groups = {
    options = {
      toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
    },
    items = {
      {
        name = "Tests",
        auto_close = true,
        matcher = function(buf)
          return buf.filename:match("%_test") or buf.filename:match("%_spec")
        end,
      },
      {
        name = "Docs",
        auto_close = true,
        matcher = function(buf)
          return buf.filename:match("%.md") or buf.filename:match("%.txt")
        end,
      },
      {
        name = "Doom",
        auto_close = true,
        matcher = function(buf)
          if buf.filename:find("doom_") or buf.filename:find("doom-", 1, true) then
            return true
          end
          return false
        end,
      },
    },
  },
  offsets = {
    {
      filetype = "NvimTree",
      text = "File Explorer",
      text_align = "center",
    },
    {
      filetype = "netrw",
      text = "File Explorer",
      text_align = "center",
    },
    {
      filetype = "minimap",
      text = "Minimap",
      text_align = "center",
    },
    {
      filetype = "Outline",
      text = "Symbols",
      text_align = "center",
    },
    {
      filetype = "packer",
      text = "Plugins Manager",
      text_align = "center",
    },
  },
  show_buffer_icons = true,
  show_buffer_close_icons = true,
  show_close_icon = true,
  show_tab_indicators = true,
  persist_buffer_sort = true,
  separator_style = "thick",
  enforce_regular_tabs = true,
  always_show_bufferline = true,
  sort_by = "directory",
  custom_areas = {
    right = function()
      local result = {}
      local error = len(vim.diagnostic.get(0, [[Error]]))
      local warning = len(vim.diagnostic.get(0, [[Warning]]))
      local info = len(vim.diagnostic.get(0, [[Information]]))
      local hint = len(vim.diagnostic.get(0, [[Hint]]))

      if error ~= 0 then
        result[1] = {
          text = "  " .. error,
          foreground = "#ff6c6b",
        }
      end

      if warning ~= 0 then
        result[2] = {
          text = "  " .. warning,
          foreground = "#ECBE7B",
        }
      end

      if hint ~= 0 then
        result[3] = {
          text = "  " .. hint,
          foreground = "#98be65",
        }
      end

      if info ~= 0 then
        result[4] = {
          text = "  " .. info,
          foreground = "#51afef",
        }
      end
      return result
    end,
  },
},
})
