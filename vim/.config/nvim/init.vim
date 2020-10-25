" Point neovim to my macports-managed Python installs
let g:python_host_prog = '/opt/local/bin/python2'
let g:python3_host_prog = '/opt/local/bin/python3'

""""""""""""""""""""""""""""""""
" Plugins: managed with vim-plug
""""""""""""""""""""""""""""""""
silent! if plug#begin('~/.config/nvim/plugged')

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

Plug 'psf/black', {'for': 'python', 'branch':'stable'}

Plug 'lervag/vimtex', {'for': 'tex'}
    let g:tex_flavor = "latex"
    let g:vimtex_compiler_progname = 'nvr'
    let g:vimtex_indent_enabled = 0

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
    let $FZF_DEFAULT_OPTS="--bind 'ctrl-u:preview-page-up,ctrl-d:preview-page-down'"

    function! s:RipgrepFind()
        " Searching for a blank pattern rejects binary files, where simply
        " using `--files` does not.
        let opts = fzf#wrap({'source': 'rg -l --hidden --follow -g "!.git" ""'})
        if &columns > 120
            let opts = fzf#vim#with_preview(opts)
        elseif &lines > 50
            let opts.window = {'width': 0.9, 'height': 0.9}
            let opts = fzf#vim#with_preview(opts, 'up:60%')
        endif
        call fzf#run(opts)
    endfunction
    command! MyFzfFiles call <SID>RipgrepFind()

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/diagnostic-nvim'
    call sign_define("LspDiagnosticsErrorSign",
        \ {"text" : ">>", "texthl": "LspDiagnosticsErrorSign"})
    call sign_define("LspDiagnosticsWarningSign",
        \ {"text" : ">>", "texthl": "LspDiagnosticsWarningSign"})

Plug 'nvim-lua/completion-nvim'
    let g:completion_matching_strategy_list = ['exact', 'fuzzy']
    let g:completion_enable_auto_signature = 0
    " let g:completion_confirm_key = "\<C-j>"

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'Shougo/echodoc.vim'
    let g:echodoc_enable_at_startup = 1

" Plug 'robert-oleynik/clangd-nvim'
Plug '~/src/edit/clangd-nvim'

call plug#end()
endif


augroup MyGroup
  au!
augroup END


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


""""""""""""""""""
" command mappings
""""""""""""""""""

" Make space the leader. Map space to backslash so that 1) It shows up in the
" command corner, and 2) it removes space's default move-right.
map <SPACE> <leader>

nmap                      s   <Plug>(easymotion-overwin-f)

nnoremap <silent> <Leader>f   <cmd>lua MyTscopeFiles()<CR>
nnoremap <silent> <Leader>F   <cmd>lua MyTscopeAllFiles()<CR>
nnoremap <silent> <Leader>b   <cmd>Buffers<CR>
nnoremap          <Leader>/   :Rg<Space>

nnoremap <silent> <leader>sd  <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> <leader>sh  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>sr  <cmd>TelescopeLspReferences<CR>
nnoremap <silent> <leader>ss  <cmd>TelescopeLspDocumentSymbols<CR>
nnoremap <silent> <leader>sw  <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

nnoremap <silent> <leader>cc  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>cn  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>cf  <cmd>lua vim.lsp.buf.formatting()<CR>

nnoremap <silent> <leader>gd  <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>gh  <cmd>lua vim.lsp.buf.declaration()<CR>

nnoremap <silent> <leader>gi  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>gt  <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>gs  <cmd>TelescopeLspDocumentSymbols<CR>

nnoremap <silent> <leader>ei  <cmd>lua MyTscopeConfigFiles()<CR>
nnoremap <silent> <leader>ed  <cmd>lua MyTscopeDotFiles()<CR>
nnoremap <silent> <leader>en  <cmd>lua MyTscopeNotesGrep()<CR>
nnoremap <silent> <Leader>eh  <cmd>History<CR>

nnoremap <silent> <leader>dd  <cmd>Dispatch<CR>
nnoremap <silent> <leader>db  <cmd>Dispatch!<CR>

nnoremap <silent>         ]d  <cmd>NextDiagnosticCycle<CR>
nnoremap <silent>         [d  <cmd>PrevDiagnosticCycle<CR>
nmap                      ]h  <Plug>(GitGutterNextHunk)
nmap                      [h  <Plug>(GitGutterPrevHunk)

" Toggle a color column at 89.
nnoremap <Leader>c :set colorcolumn=<C-R>=&colorcolumn != 0 ? 0 : 89<CR><CR>

" Navigate popup menus, notably completions, with tab.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


""""""
" UI
""""""
colorscheme gruvbox-tweaked

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

" Respond more quickly.
set updatetime=300

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
