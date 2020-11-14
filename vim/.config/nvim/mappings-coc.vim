nnoremap <silent> <leader>f   <cmd>call my#RgFind()<cr>
nnoremap <silent> <leader>F   <cmd>FzfFiles<cr>
nnoremap <silent> <leader>b   <cmd>FzfBuffers<cr>
nnoremap          <leader>/   :FzfRg<Space>

nmap     <silent> <leader>sd  <Plug>(coc-diagnostic-info)
nnoremap <silent> <leader>sh  <cmd>call CocActionAsync('doHover')<cr>

nmap     <silent> <leader>cc  <Plug>(coc-codeaction-line)
nmap     <silent> <leader>cr  <Plug>(coc-refactor)
nmap     <silent> <leader>cn  <Plug>(coc-rename)
nmap     <silent> <leader>cf  <Plug>(coc-format)

nmap     <silent> <leader>gd  <Plug>(coc-definition)
nmap     <silent> <leader>gh  <Plug>(coc-declaration)
nmap     <silent> <leader>gi  <Plug>(coc-implementation)
nmap     <silent> <leader>gt  <Plug>(coc-type-definition)
nnoremap <silent> <leader>go  <cmd>CocFzfList outline<cr>
nnoremap <silent> <leader>ge  <cmd>CocFzfList diagnostics<cr>
nmap     <silent> <leader>gr  <Plug>(coc-references)

nnoremap <silent> <leader>ei  <cmd>call my#ConfigFiles()<cr>
nnoremap <silent> <leader>ed  <cmd>call my#Dotfiles()<cr>
nnoremap <silent> <leader>en  <cmd>call my#LiveRgNotes()<cr>
nnoremap <silent> <leader>eh  <cmd>FzfHistory<cr>

nnoremap <silent> <leader>tc  <cmd>call <SID>toggle_autotrigger()<cr>

nmap     <silent>         ]d  <Plug>(coc-diagnostic-prev)
nmap     <silent>         [d  <Plug>(coc-diagnostic-next)

inoremap <silent>  <c-space>  <cmd>call coc#start()<cr>
inoremap <silent>      <tab>  <cmd>call <SID>smart_tab()<cr>
inoremap <silent>    <s-tab>  <cmd>call <SID>smart_s_tab()<cr>

xmap                      if  <Plug>(coc-funcobj-i)
omap                      if  <Plug>(coc-funcobj-i)
xmap                      af  <Plug>(coc-funcobj-a)
omap                      af  <Plug>(coc-funcobj-a)
xmap                      ic  <Plug>(coc-classobj-i)
omap                      ic  <Plug>(coc-classobj-i)
xmap                      ac  <Plug>(coc-classobj-a)
omap                      ac  <Plug>(coc-classobj-a)
xmap              <leader>cf  <Plug>(coc-format-selected)

function! s:smart_tab()
    if pumvisible()
        call feedkeys("\<c-n>", "n")
        return
    endif

    let col = col('.') - 1
    if !col || getline('.')[col - 1] =~# '\s'
        call feedkeys("\<tab>", "n")
    else
        call coc#start()
    endif
endfunction

function! s:smart_s_tab()
    call feedkeys((pumvisible() ? "\<c-p>" : "\<c-h>"), "n")
endfunction

let s:at_status = 1
function! s:toggle_autotrigger()
    if s:at_status
        call coc#config("suggest.autoTrigger", "none")
        echo "autoTrigger disabled"
        let s:at_status = 0
    else
        call coc#config("suggest.autotrigger", "always")
        echo "autoTrigger enabled"
        let s:at_status = 1
    endif
endfunction
