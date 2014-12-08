qmdown (Quick Markdown)
---

**Warning**: Still work in progress.

In one sentence: Quickly render, view and sync up markdown from vim.

I like using markdown when writing. And I do that in Vim. I wanted a way to
quickly see the html results of my markdown. I also wanted to publish the
results to my remote server for sharing. This simple vim plugin implements
that.

The conversion is done by a python script, you need python for this to work 
and `markdown2` has to be installed:

```sh
$ pip install markdown2
```

This plugin fires up a shell command that runs the current markdown file
against a python script that converts to html.


TODO:
---
  - find path to python script dynamically (DONE: sort of)
  - allow user to set remote machine and other dynamic vars
  - allow user to set `<leader>` key.
  - detect system and `open` accordingly
  - document styles and python script


Install
---

Assuming you are using pathoghen and vundle add this to your `.vimrc`:

`Bundle 'drio/vim-qmdown`

Usage
---

`<leader>mh` → generate html for current file (a <name>.html will be created)
`<leader>mo` → generate html and open (fires mac open)
`<leader>mr` → generate html and sync to remote server.
  - For this last one you have to set up a remote machine and a remote directory.
    The markdown will be rsynced there. The plugin expects you have a passwordless
    setup against that server.

