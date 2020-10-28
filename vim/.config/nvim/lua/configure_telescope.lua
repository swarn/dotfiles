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
    generic_sorter = sorters.get_fzy_sorter,
    file_sorter = sorters.get_fzy_sorter,
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
    vim.api.nvim_call_function('stdpath', {'config'})
  )
end

function MyTscopeDotFiles()
  MyTscopeFinder(
    {"rg", "--files", "--follow", "--hidden", "-g", "!plugged"},
    vim.env.XDG_CONFIG_HOME
  )
end

function MyTscopeNotesGrep()
  local conf = require('telescope.config').values
  local note_path = vim.env.NOTES
  local opts = get_my_theme()
  opts.shorten_path = true
  opts.disable_coordinates = true

  local rg = {'rg', '--max-count', '1', '--color=never', '--no-heading',
    '--with-filename', '--line-number', '--column', '--smart-case'}

  local live_grepper = finders.new_job(
    function(prompt)
      if not prompt then
        return nil
      end

      return vim.tbl_flatten { rg, prompt, note_path }
    end,
    make_entry.gen_from_vimgrep(opts),
    opts.max_results
  )

  pickers.new(opts, {
    finder = live_grepper,
    previewer = previewers.vimgrep.new(opts),
    sorter = conf.generic_sorter(opts),
  }):find()
end
