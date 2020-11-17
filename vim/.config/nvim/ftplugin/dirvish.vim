if executable("qlmanage")
    if has("nvim")
        nmap <buffer> <silent> L :call jobstart(["qlmanage", "-p", getline(".")])<CR>
    else
        nmap <buffer> <silent> L :call job_start(["qlmanage", "-p", getline(".")])<CR>
    endif
endif
