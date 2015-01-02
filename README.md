qmdown (Quick Markdown)
---

In one sentence: Quickly render, view and sync up markdown from vim.

I like using markdown when writing. And I do that in Vim. I wanted a way to
quickly see the html results of my markdown. I also wanted to publish them
to my remote server for sharing. This simple vim plugin implements
that.

The conversion is done by a python script, you need python for this to work 
and `markdown2` has to be installed:

```sh
$ pip install markdown2
```

This plugin fires up a shell command that runs the current markdown against
the python script that converts to html. The command would be run using
[Dispatch](https://github.com/tpope/vim-dispatch) if available otherwise
`execute` will be used (synchronously).


TODO:
---
  - detect system and `open` accordingly


Install
---

Assuming you are using pathoghen and vundle add this to your `.vimrc`:

`Bundle 'drio/vim-qmdown`

Usage
---

Map some keys to fire up the different entry points to the plugin:

To generate html:

`nnoremap <leader>mh :call QMD_main('compile')<CR>`

To generate html and open in the current browser (osx):

`nnoremap <leader>mo :call QMD_main('open')<CR>`

To transfer the generated html to a remote server:

`nnoremap <leader>mr :call QMD_main('rsync', 'apu:public_html/markdown')<CR>`

For this last one, the second parameter is an ssh url that contains the 
name of the hosts and the remote directory.
