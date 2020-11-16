let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0
let g:python3_host_prog = '/opt/local/bin/python3.9'

let s:use_coc = 1

augroup MyGroup
  au!
augroup END

""""""""""""""""""""""""""""""""
" Plugins: managed with vim-plug
""""""""""""""""""""""""""""""""
silent! if plug#begin(stdpath('data') . '/plugged')

Plug 'gruvbox-community/gruvbox'
    let g:gruvbox_bold = 1
    let g:gruvbox_italic = 1
    let g:gruvbox_contrast_dark = "hard"
    let g:gruvbox_contrast_light = "hard"
    let g:gruvbox_invert_selection = 0
    let g:gruvbox_sign_column = "bg0"

Plug 'vim-airline/vim-airline'
    let g:airline_theme = 'gruvbox'
    let g:airline_section_z = '%l/%L:%2v'
    let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

Plug 'airblade/vim-gitgutter'
    let g:gitgutter_grep = 'rg'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'
    " Latex definitions. Where * is the cursor:
    "   Old text        Command       New text
    "   Hello w*orld    ysiwcemph     Hello \emph{world}
    "   Hello w*orld    ysiwecenter   Hello \begin{center}world\end{center}
    let g:surround_{char2nr('c')} = "\\\1command: \1{\r}"
    let g:surround_{char2nr('e')} = "\\begin{\1environment: \1}\r\\end{\1\1}"

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-dispatch'
    let g:dispatch_no_maps = 1

Plug 'tpope/vim-repeat'

Plug 'wellle/targets.vim'

Plug 'psliwka/vim-smoothie'

Plug 'easymotion/vim-easymotion'
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase = 1

Plug 'justinmk/vim-dirvish'
    let dirvish_mode = ':sort ,^.*/,'

Plug 'farmergreg/vim-lastplace'

Plug 'Rykka/riv.vim', {'for': 'rst'}
    let g:riv_disable_folding = 1
    let g:riv_fold_auto_update = 0

Plug 'lervag/vimtex', {'for': 'tex'}
    let g:tex_flavor = "latex"
    let g:vimtex_indent_enabled = 0
    let g:vimtex_view_method = 'skim'
    let g:vimtex_view_automatic = 1
    let g:vimtex_quickfix_open_on_warning = 0
    let g:vimtex_quickfix_autoclose_after_keystrokes = 3

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
    let g:vim_markdown_auto_insert_bullets = 0
    let g:vim_markdown_new_list_item_indent = 0

Plug 'iamcco/markdown-preview.nvim', {
    \ 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    let $FZF_DEFAULT_OPTS="--bind 'ctrl-u:preview-page-up,ctrl-d:preview-page-down'"
    let g:fzf_command_prefix = 'Fzf'

Plug 'antoinemadec/FixCursorHold.nvim'
    let g:cursorhold_updatetime = 100

Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"

if s:use_coc

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
    let g:coc_global_extensions = [
      \ 'coc-clangd',
      \ 'coc-json',
      \ 'coc-pyright',
      \ 'coc-ultisnips',
      \ 'coc-yaml',
      \ ]

    " Disable airline's display of lsp server status in coc.
    function! AirlineInit()
        let g:airline_section_c =
            \ airline#section#create(['%<', 'file', ' ', 'readonly'])
    endfunction
    autocmd User AirlineAfterInit call AirlineInit()

else

Plug 'neovim/nvim-lspconfig'
Plug 'robert-oleynik/clangd-nvim'

Plug 'nvim-lua/completion-nvim'
    let g:completion_matching_strategy_list = ['exact', 'fuzzy']
    let g:completion_enable_auto_signature = 0
    let g:completion_docked_hover = 1
    let g:completion_enable_snippet = 'UltiSnips'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'Shougo/echodoc.vim'
    let g:echodoc_enable_at_startup = 1

endif

call plug#end()
endif


if ! s:use_coc

" nvim-lspconfig
lua require('lsp_servers')

" completion-nvim
function s:AttachCompletionIfLoaded()
    if exists('g:loaded_completion')
        lua require'completion'.on_attach()
    endif
endfunction
autocmd MyGroup BufEnter * call <SID>AttachCompletionIfLoaded()

" telescope.nvim
lua require('configure_telescope')

endif


""""""""""""""""""
" command mappings
""""""""""""""""""

" Make space the leader. Map space to backslash so that 1) It shows up in the
" command corner, and 2) it removes space's default move-right.
map <SPACE> <leader>

nmap                      s   <Plug>(easymotion-overwin-f)

nnoremap <silent> <leader>dd  <cmd>Dispatch<CR>
nnoremap <silent> <leader>db  <cmd>Dispatch!<CR>

nnoremap <silent> <leader>tw  :set colorcolumn=<C-R>=&colorcolumn != 0 ? 0 : 89<CR><CR>

nmap     <silent>         ]h  <Plug>(GitGutterNextHunk)
nmap     <silent>         [h  <Plug>(GitGutterPrevHunk)

if s:use_coc
    runtime mappings-coc.vim
else
    runtime mappings-lua.vim
endif


""""""
" UI
""""""
colorscheme gruvbox-tweaked

sign define LspDiagnosticsSignError text=●
sign define LspDiagnosticsSignWarning text=●
sign define LspDiagnosticsSignInformation text=●
sign define LspDiagnosticsSignHint text=●

set number                  " line numbering
set hidden                  " allow changed buffers in the background
set fillchars=vert:│        " vertical window split uses thin line
set termguicolors           " enable truecolor
set signcolumn=yes          " always show the sign column
set ignorecase              " ignore case when searching
set smartcase               " ... unless search has capital letters
set nofoldenable            " disable folding
set noshowmode              " I can tell what mode I'm in.

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Show ex command changes (e.g. :s) in realtime.
set inccommand=nosplit

" Quickfix window always opens full-width, rather than just the bottom of the
" current window.
autocmd MyGroup filetype qf wincmd J

" Disable some UI elements in the quickfix window.
autocmd MyGroup filetype qf setlocal nonumber colorcolumn=

" Split opening order
set splitbelow
set splitright

" Allow mouse
set mouse=a


"""""""""""""""""
" Tabs and spaces
"""""""""""""""""
set expandtab       " insert spaces when tab is pressed
set shiftwidth=4    " indentation size for < and > commands
set tabstop=4       " render tabs with this many spaces
set lcs=tab:»·      " show tabs with »
set lcs+=trail:·    " show trailing spaces with ·
set list            " show the lcs characters

" riv seems to override my defaults, so set them again
au MyGroup FileType rst setlocal tabstop=4 shiftwidth=4 softtabstop=4

" lua custom seems to be two spaces
au MyGroup Filetype lua setlocal tabstop=2 shiftwidth=2 softtabstop=2
