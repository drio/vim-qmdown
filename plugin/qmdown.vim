if exists('g:loaded_qmdown') || &cp
    finish
endif
let g:loaded_qmdown = 1


function! QMD_run(cmd)
  if exists("g:loaded_dispatch") 
    Dispatch a:cmd
  else
    execute "!" . a:cmd
  endif
endfunction


function! QMD_main(task, ...)
  silent !clear
  write
  
  let l:remote      = "http://davidr.io/~drio/markdown/"
  " FIXME: There has to be a better way
  let l:converter   = split(&runtimepath, ",")[0] . "/bundle/vim-qmdown/plugin/md_to_html.py"
  let l:md_file     = expand("%")
  let l:extension   = expand("%:e")
  let l:html_file   = expand("%:r") . ".html"
  let l:convert_cmd = l:converter . " " . l:md_file . " >" . l:html_file 
  let l:bn_html     = substitute(expand("%:t"), "." . l:extension, ".html", "")

  if a:task == "compile"
    call QMD_run(l:convert_cmd)
  endif

  if a:task == "open"
    call QMD_run(l:convert_cmd . ";open " . l:html_file)
  endif

  if a:task == "rsync"
    call QMD_run(l:convert_cmd . ";scp " . l:html_file . " " . a:1)
  endif
endfunction
