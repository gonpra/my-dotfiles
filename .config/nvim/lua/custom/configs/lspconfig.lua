require("neodev").setup({
    override = function (root_dir, library)
        if root_dir:find("/etc/nixos", 1, true) == 1 then
            library.enabled = true
            library.plugins = true
        end
    end,
})

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
local lombok = vim.fn.stdpath('data') .. '/mason/packages/jdtls/lombok.jar'

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      }
    },
  },
}

lspconfig.jdtls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "jdtls",
        "--jvm-arg=-javaagent:" .. lombok
    },
    filetypes = { "java" }
}

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            }
        }
    }
}
