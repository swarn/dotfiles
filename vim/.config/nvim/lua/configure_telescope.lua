local telescope = require('telescope')
local actions = require('telescope.actions')
local pickers = require('telescope.pickers')
local make_entry = require('telescope.make_entry')
local finders = require('telescope.finders')
local previewers = require('telescope.previewers')
local sorters = require('telescope.sorters')


telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-j>"] = actions.move_selection_next,
      }
    },
    generic_sorter = require('telescope.sorters').get_fzy_sorter,
    file_sorter = require('telescope.sorters').get_fzy_sorter,
  }
}


local function get_my_theme()
  return {
    theme = "minimal",

    prompt_title = false,
    results_title = false,
    preview_title = false,
  }
end


-- My replacement for builtin.find_files, only because I want to customize
-- the prompt title.
local function MyTscopeFinder(find_command, cwd)
  local opts = get_my_theme()
  if cwd then opts.cwd = cwd end
  opts.entry_maker = make_entry.gen_from_file(opts)
  opts.finder = finders.new_oneshot_job(find_command, opts)
  opts.previewer = previewers.cat.new(opts)
  opts.sorter = sorters.get_fzy_sorter()
  pickers.new(opts):find()
end

function MyTscopeFiles()
  MyTscopeFinder{"rg", "-l", "--hidden", "--follow", "-g", "!.git", ""}
end

function MyTscopeAllFiles()
  MyTscopeFinder{"rg", "--files", "-uuu"}
end

function MyTscopeConfigFiles()
  MyTscopeFinder(
    {"rg", "--files", "--follow", "-g", "!plugged"},
    vim.api.nvim_call_function('fnamemodify', {vim.env.MYVIMRC, ':h'})
  )
end
