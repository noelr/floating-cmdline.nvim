" Vim syntax file for floating command line
" Language: Floating Command Line
" Maintainer: Auto-generated

if exists("b:current_syntax")
  finish
endif

" Match command lines (non-indented, non-empty lines)
syntax match floatingcmdCommand "^\s\@!.*$"

" Match metadata lines (lines starting with --CMD:, with or without ID)
syntax match floatingcmdMetadata "^  --CMD:.*$"

" Match output lines (lines starting with two spaces, but not metadata)
syntax match floatingcmdOutput "^  \(--CMD:\)\@!.*$"

" Match error lines (lines containing Error:)
syntax match floatingcmdError "^  Error:.*$"

" Match truncation summary lines
syntax match floatingcmdTruncated "^  \.\.\. .* more lines$"


" Define default highlighting
hi def link floatingcmdCommand Statement
hi def link floatingcmdOutput Comment  
hi def link floatingcmdError ErrorMsg
hi def link floatingcmdMetadata NonText
hi def link floatingcmdTruncated Special

let b:current_syntax = "floatingcmd"