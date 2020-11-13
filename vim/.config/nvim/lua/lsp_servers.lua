-- Confusingly, the lsp-config plugin module is "nvim_lsp"
local nvim_lsp = require("nvim_lsp")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
  }
)

local clangd_nvim = require'clangd_nvim'
nvim_lsp.clangd.setup{
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = false
        }
      },
      semanticHighlightingCapabilities = {
        semanticHighlighting = true
      }
    }
  },
  on_init = clangd_nvim.on_init,
}

nvim_lsp.pyls.setup{
  settings = {
    pyls = {
      plugins = {
        pycodestyle = { enabled = false; };
        yapf = { enabled = false; };

        pyflakes = { enabled = true; };
      };
    };
  };
}

nvim_lsp.sumneko_lua.setup{
  cmd = {
    "/Users/seth/src/edit/lua-language-server/bin/macOS/lua-language-server",
    "-E",
    "/Users/seth/src/edit/lua-language-server/main.lua"
  },
  settings = {
    Lua = {
      diagnostics = {
        globals = {"hs", "vim", "describe", "it", "before_each", "after_each"}
      },
    },
  },
}
