nnoremap <leader>mh :call markdown_to_html('compile')<CR>
nnoremap <leader>mo :call markdown_to_html('open')<CR>
nnoremap <leader>mr :call markdown_to_html('rsync')<CR>

" grip the current file and open it in browser (open)
function! s:markdown_to_html(task)
  " TODO:
  " - find path to python script dynamically
  " - allow user to set remote and other dynamic vars
  silent !clear
  write

  let l:p_path      = expand('<sfile>:p:h')
  let l:remote      = "http://davidr.io/~drio/markdown/"
  let l:converter   = "/Users/drio/dev/playground/md_to_html.py"
  let l:md_file     = expand("%")
  let l:extension   = expand("%:e")
  let l:html_file   = expand("%:r") . ".html"
  let l:convert_cmd = "!" . l:converter . " " . l:md_file . " >" . l:html_file 
  let l:bn_html     = substitute(expand("%:t"), "." . l:extension, ".html", "")

  " Always convert to html
  if a:task == "compile"
    execute l:convert_cmd
  endif

  if a:task == "open"
    execute l:convert_cmd . ";open " . l:html_file
  endif

  if a:task == "rsync"
    execute l:convert_cmd .
      \ ";echo " . "extension: " . l:extension
      \ ";echo " . "html file: " . l:html_file
      \ ";scp " . l:html_file . " apu:public_html/markdown/"
  endif
endfunction
