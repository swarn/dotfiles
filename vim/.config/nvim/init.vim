" Both vim and neovim use this file; vimrc tells vim to use the neovim paths
" and sets many values to neovim defaults.
if ! has ('nvim')
    source $HOME/.config/nvim/vimrc
endif

let g:python_host_prog = '/opt/local/bin/python2'
let g:python3_host_prog = '/opt/local/bin/python3'

""""""""""""""""""""""""""""""""
" Plugins: managed with vim-plug
""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

Plug 'gruvbox-community/gruvbox'            " color scheme
Plug 'vim-airline/vim-airline'              " status line
Plug 'airblade/vim-gitgutter'               " show git status per line
Plug 'tpope/vim-fugitive'                   " general git tools
Plug 'tpope/vim-surround'                   " surround motions
Plug 'tpope/vim-commentary'                 " auto commenting
Plug 'tpope/vim-vinegar'                    " file browsing
Plug 'Valloric/YouCompleteMe'               " auto completion
Plug '/opt/local/share/fzf/vim'             " fuzzy search
Plug 'junegunn/fzf.vim'                     " enhancements to fzf vim
Plug 'SirVer/ultisnips'                     " snippets
Plug 'honza/vim-snippets'                   " snippet definitions

Plug 'octol/vim-cpp-enhanced-highlight'     " C++
Plug 'Rykka/riv.vim', {'for': 'rst'}        " ReST
Plug 'psf/black', {'for': 'python'}         " Python code formatter
Plug 'lervag/vimtex', {'for': 'tex'}        " LaTeX

call plug#end()


" Reset the vmrc augroup. Commands added to this group are reset when
" reloading this file.
augroup vimrc
  au!
augroup END


""""""
" UI
""""""
set number                  " line numbering
set hidden                  " allow changed buffers in the background
set fillchars=vert:\        " vertical window split has no symbol
set termguicolors           " enable truecolor
set colorcolumn=88

" gruvbox color scheme
let g:gruvbox_bold=0
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"
let g:gruvbox_invert_selection=0
colorscheme gruvbox

" airline status bar
let g:airline_theme='gruvbox'

" Minimal position section on right of status bar
let g:airline_section_z = '%l/%L:%2v'

" Don't show encoding if it's utf-8.
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" git gutter
set signcolumn=yes


""""""""""""""""""
" command mappings
""""""""""""""""""
" Make space the leader. Map space to backslash so that 1) It shows up in the
" command corner, and 2) it removes space's default move-right.
map <SPACE> <leader>

" fzf
" Custom command; use RipGrep to list files. This will respect .gitignore if
" present, while ignoring binary files.
command! -bang RgFiles call fzf#run(fzf#wrap(
    \ {'source': 'rg -l ""', 'sink': 'e'}, <bang>0))

nnoremap <Leader>f :RgFiles<CR>
nnoremap <Leader>F :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>/ :Rg<Space>

" YouCompleteMe
nnoremap <leader>i :YcmCompleter FixIt<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>tf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>tc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>tt :YcmCompleter GetType<CR>
nnoremap <leader>td :YcmShowDetailedDiagnostic<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Disable gitgutter's default mappings
let g:gitgutter_map_keys = 0


"""""""""""""""""
" Tabs and spaces
"""""""""""""""""
set expandtab       " insert spaces when tab is pressed
set shiftwidth=4    " indentation size for < and > commands
set tabstop=4       " render tabs with this many spaces
set lcs=tab:»·      " show tabs with »
set lcs+=trail:·    " show trailing spaces with ·
set list            " show the lcs characters

" riv seems to override my defaults
au vimrc FileType rst
      \ set tabstop=4 |
      \ set shiftwidth=4 |
      \ set softtabstop=4

" Vimtex's indenting doesn't seem great to me, and it's laggy
let g:vimtex_indent_enabled = 0


""""""""""""""""
" Other Behavior
""""""""""""""""
set ignorecase              " ignore case when searching
set smartcase               " ... unless search has capital letters
set nofoldenable            " disable folding

" Quickfix window always opens full-width, rather than just the bottom of the
" current window.
autocmd filetype qf wincmd J

" Disable some UI elements in the quickfix window.
autocmd filetype qf setlocal nonumber colorcolumn=

" Disable preview window for completions
set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_autoclose_preview_window_after_insertion = 1

" Assume all .tex files are latex.
let g:tex_flavor = "latex"

" A little less highlighting in C++
let g:cpp_no_function_highlight=1

" Tell Black to store its files in a better place
let g:black_virtualenv = "~/.local/share/nvim_black"

" Tell riv to stop being so aggressive about folding.
let g:riv_disable_folding = 1
let g:riv_fold_auto_update = 0


"""""""""""""""""""""""""""""
" Options exclusive to neovim
"""""""""""""""""""""""""""""
if has ('nvim')
    " Show ex command changes (e.g. :s) in realtime.
    set inccommand=nosplit

    " Make vimtex talk to Neovim using neovim-remote.
    let g:vimtex_compiler_progname = 'nvr'

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event
    " handler.
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
endif


" Tell GUI-based vims to use my gvimrc, because I don't have it in the
" usual place.
if has ('gui_running')
    source $HOME/.config/nvim/gvimrc
endif
