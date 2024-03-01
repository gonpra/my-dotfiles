local M = {}

M.custom_general = {
  n = {
    ["<C-Left>"] = { "<C-w>h", "Window left" },
    ["<C-Right>"] = { "<C-w>l", "Window right" },
    ["<C-Down>"] = { "<C-w>j", "Window down" },
    ["<C-Up>"] = { "<C-w>k", "Window up" },
    ["<C-d>"] = {
        function ()
            vim.cmd("DBUIToggle")
        end
    },
    ["<leader>q"] = {
      function ()
        vim.cmd("qa!")
      end,
      "Quit Neovim"
    },
  }
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line"
        },
        ["<leader>dus"] = {
            function ()
                local widgets = require("dap.ui.widgets")
                local sidebar = widgets.sidebar(widgets.scopes)
                sidebar.open()
            end,
            "Open debugging sidebar"
        },
        ["<leader>dt"] = {
            "<cmd> lua require('dapui').toggle() <CR>",
            "Enable Debug UI"
        },
        ["<leader>dc"] = {
            "<cmd> lua require('dap').continue() <CR>",
            "Continue debugging"
        }
    }
}

M.markdown_preview = {
    plugin = true,
    n = {
        ["<leader>mdt"] = {
            "<cmd> MarkdownPreviewToggle <CR>",
            "Toggle markdown preview"
        }
    }
}

M.trouble = {
    plugin = true,
    n = {
        ["<leader>xx"] = {
            function ()
                require("trouble").toggle()
            end,
            "Toggle Diagnostics"
        }
    }
}

return M
