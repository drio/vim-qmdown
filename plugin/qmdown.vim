if exists('g:loaded_quickmardown') || &cp
    finish
endif
let g:loaded_quickmardown = 1


function! QMD_run(cmd)
  if exists("g:loaded_dispatch") 
    let b:dispatch = a:cmd
    Dispatch
  else
    execute "!" . a:cmd
  endif
endfunction


" grip the current file and open it in browser (open)
function! QMD_main(task)
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

  " Always convert to html
  if a:task == "compile"
    call QMD_run(l:convert_cmd)
  endif

  if a:task == "open"
    " let b:dispatch = l:convert_cmd . ";open " . l:html_file
    " Dispatch
    call QMD_run(l:convert_cmd . ";open " . l:html_file)
  endif

  if a:task == "rsync"
    let l:cmd = l:convert_cmd . ";scp " . l:html_file . " apu:public_html/markdown/"
    call QMD_run(l:cmd)
  endif
endfunction

nnoremap <leader>mh :call QMD_main('compile')<CR>
nnoremap <leader>mo :call QMD_main('open')<CR>
nnoremap <leader>mr :call QMD_main('rsync')<CR>
