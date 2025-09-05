" floating-cmdline.nvim plugin
" Provides floating command line interface

if exists('g:loaded_floating_cmdline')
  finish
endif
let g:loaded_floating_cmdline = 1

" Commands
command! FloatingCmdline lua require('floating-cmdline').toggle()
command! FloatingCmdlineToggle lua require('floating-cmdline').toggle()
command! FloatingCmdlineOpen lua require('floating-cmdline').open()
command! FloatingCmdlineClose lua require('floating-cmdline').close()

" Default keybindings (can be overridden by user)
if !exists('g:floating_cmdline_no_default_bindings')
  nnoremap <silent> <leader>fc :FloatingCmdline<CR>
endif