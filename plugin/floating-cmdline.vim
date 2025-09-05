" floating-cmdline.nvim plugin
" Provides floating command line interface

if exists('g:loaded_floating_cmdline')
  finish
endif
let g:loaded_floating_cmdline = 1

" Commands
command! FloatingCmdline lua require('floating-cmdline').open()