local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-j>"] = actions.move_selection_next,
      }
    }
  }
}


my_goto_symbol = builtin.lsp_document_symbols


function my_goto_file()
  builtin.find_files{
    find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" }
  }
end
