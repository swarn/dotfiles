if exists("g:loaded_fzf_customizations")
    finish
endif
let g:loaded_fzf_customizations = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:AdaptiveFzf(opts)
    if &columns > 120
        return fzf#vim#with_preview(a:opts)
    elseif &lines > 45
        let a:opts.window = {'width': 0.9, 'height': 0.9}
        return fzf#vim#with_preview(a:opts, 'up:45%')
    endif
    return a:opts
endfunction

function! my#RgFind()
    " Searching for a blank pattern rejects binary files, where simply
    " using `--files` does not.
    let cmd = 'rg -l --hidden --follow -g "!.git" ""'
    call fzf#run(s:AdaptiveFzf(fzf#wrap({'source': cmd})))
endfunction

function! my#ConfigFiles()
    let cmd = 'rg --files --follow -g "!plugged"'
    let opts = s:AdaptiveFzf(fzf#wrap({'source': cmd, 'dir': stdpath('config')}))
    call fzf#run(opts)
endfunction

function! my#Dotfiles()
    let cmd = 'rg --files --follow --hidden -g "!plugged"'
    let opts = s:AdaptiveFzf(fzf#wrap({'source':cmd, 'dir': $XDG_CONFIG_HOME}))
    call fzf#run(opts)
endfunction

function! my#LiveRgNotes()
    let command_fmt = 'rg --max-count 1 --column --line-number
        \ --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(''))
    let reload_command = printf(command_fmt, '{q}')
    let spec = s:AdaptiveFzf({'dir': $NOTES,
        \ 'options': ['--phony', '--bind', 'change:reload:'.reload_command]})
    call fzf#vim#grep(initial_command, 1, spec)
endfunction

 let &cpo = s:save_cpo
 unlet s:save_cpo
