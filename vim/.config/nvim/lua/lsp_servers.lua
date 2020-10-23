-- Set up various LSPs, modifying the sane defaults from lsp-config as needed
-- for each server. The diagnostic-nvim and completion-nvim define callbacks to
-- handle UI. If re-sourcing this file, the callbacks are redefined, so reload
-- the buffer to attach to the new callbacks and see lsp results again.

-- Confusingly, the lsp-config plugin module is "nvim_lsp"
local nvim_lsp = require("nvim_lsp")

-- Load modules from plugins.
-- Skipping nvim_completion here: I use it for all buffers
-- local nvim_completion = require("completion")
local nvim_diagnostic = require("diagnostic")

local custom_attach = function()
  -- nvim_completion.on_attach()
  nvim_diagnostic.on_attach()
  print("LSP Attached.")
end

local clangd_nvim = require'clangd_nvim'
nvim_lsp.clangd.setup{
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      },
      semanticHighlightingCapabilities = {
        semanticHighlighting = true
      }
    }
  },
  on_attach = custom_attach,
  on_init = clangd_nvim.on_init,
}

nvim_lsp.pyls.setup{
    on_attach = custom_attach,
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
