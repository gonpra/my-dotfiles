local plugins = {
    {
        "neovim/nvim-lspconfig",
        config = function ()
          require "plugins.configs.lspconfig"
          require "custom.configs.lspconfig"
        end
    },
    {
        "nvimtools/none-ls.nvim",
        ft = "go",
        opts = function ()
          return require "custom.configs.null-ls"
        end,
    },
    {
        "lervag/vimtex",
        lazy = false,
        config = function()
            vim.g.vimtex_view_general_viewer = "evince"
        end,
    },
    {
        "tpope/vim-dadbod"
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod", lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function ()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "dbout",
                callback = function ()
                    vim.wo.foldenable = false
                end,
            })
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    {
        "mfussenegger/nvim-dap",
        init = function ()
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function (_, opts)
            require("dap-go").setup(opts)
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function ()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function ()
                dapui.open()
            end

            dap.listeners.before.event_terminated["dapui_config"] = function ()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function ()
                dapui.close()
            end
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown", "md" },
        init = function ()
            require("core.utils").load_mappings("markdown_preview")
        end,
        build = function ()
            vim.fn["mkdp#util#install"]()
        end
    },
    {
        "folke/neodev.nvim",
    },
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        init = function ()
            require("core.utils").load_mappings("trouble")
        end
    }
}

return plugins
