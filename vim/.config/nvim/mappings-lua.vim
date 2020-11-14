nnoremap <silent> <leader>f   <cmd>lua MyTscopeFiles()<cr>
nnoremap <silent> <leader>F   <cmd>lua MyTscopeAllFiles()<cr>
nnoremap <silent> <leader>b   <cmd>FzfBuffers<cr>
nnoremap          <leader>/   :FzfRg<Space>

nnoremap <silent> <leader>sd  <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <silent> <leader>sh  <cmd>lua vim.lsp.buf.hover()<cr>

nnoremap <silent> <leader>cc  <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <silent> <leader>cr  <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <silent> <leader>cn  <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <silent> <leader>cf  <cmd>lua vim.lsp.buf.formatting()<cr>

nnoremap <silent> <leader>gd  <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> <leader>gh  <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> <leader>gi  <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> <leader>gt  <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> <leader>go  <cmd>Telescope lsp_document_symbols<cr>
nnoremap <silent> <leader>ge  <cmd>lua vim.lsp.diagnostic.set_loclist()<cr>
nnoremap <silent> <leader>gr  <cmd>Telescope lsp_references<cr>

nnoremap <silent> <leader>ei  <cmd>lua MyTscopeConfigFiles()<cr>
nnoremap <silent> <leader>ed  <cmd>lua MyTscopeDotFiles()<cr>
nnoremap <silent> <leader>en  <cmd>lua MyTscopeNotesGrep()<cr>
nnoremap <silent> <leader>eh  <cmd>FzfHistory<cr>

nnoremap <silent> <leader>tc  <cmd>CompletionToggle<cr>

nnoremap <silent>         ]d  <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <silent>         [d  <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>

imap     <silent>  <c-space>  <Plug>(completion_trigger)
imap                   <tab>  <Plug>(completion_smart_tab)
imap                 <s-tab>  <Plug>(completion_smart_s_tab)
