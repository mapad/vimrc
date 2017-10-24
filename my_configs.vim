let g:neocomplete#enable_at_startup = 1

" buffer name in window
"set guitablabel=%t
"
"
" ZOOM WINDOW
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-W>z :ZoomToggle<CR>

" use ag instead of Ack
if executable('ag')
  let g:ackprg = 'rg -F --vimgrep'
  let g:ack_use_dispatch = 1
end

"don't loose selection when indenting
xnoremap <  <gv
xnoremap >  >gv

"Grepper
nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>G :Grepper -tool git<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['rg', 'git']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0

" Git history of file
nnoremap <leader>hh :!tig %:p<cr>

let mapleader = "\<Space>"

" GitGutter
nmap <Leader>hp :GitGutterPreviewHunk<CR>
nmap <Leader>hs :GitGutterStageHunk<CR>
nmap <Leader>hu :GitGutterRevertHunk<CR>
nmap ]c :GitGutterNextHunk<CR>
nmap [c :GitGutterPrevHunk<CR>

" Persist custom tab names form Taboo by saving globals
set sessionoptions=buffers,globals,tabpages

" go to next/previous buffer FAST...
nnoremap bn :bnext<CR>
nnoremap bN :bprevious<CR>
nnoremap bp :bprevious<CR>

function! SwitchBuffer()
  b#
endfunction

nmap <Tab> :call SwitchBuffer()<CR>

" Jump to last tab
let g:lasttab = 1
nmap <Leader><Tab> :exe "tabn " . g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" close buffer and keep the window split
nnoremap bd :bp \|bd #<CR>

