let g:deoplete#enable_at_startup = 1

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

" use rg instead of Ack
if executable('rg')
  let g:ackprg = 'rg -F --vimgrep'
  let g:ack_use_dispatch = 1
end

"don't loose selection when indenting
xnoremap <  <gv
xnoremap >  >gv

"Grepper change tool
nnoremap <Leader>g :Grepper -tool rg<cr>
nnoremap <Leader>G :Grepper -tool git<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['rg', 'git']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<Leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0

" Git history of file
nnoremap <Leader>hh :!tig %:p<cr>

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

" Vim-GO
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')

" Vim-GO but might slow down
let g:go_auto_type_info = 1
let g:go_auto_sameids = 0
let g:go_metalinter_autosave = 1

" NERD Tree
let g:NERDTreeWinPos = "left"
map <Leader>e :NERDTreeMirrorToggle <CR>
map <Leader>E :NERDTreeTabsOpen <CR>

" TMUX MOUSE support
set mouse+=a
if &term =~'^screen'
    set ttymouse=xterm2
endif

" Ctrl+W Ctrl+] Ctrl+W Ctrl+t: open tag into new tab
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" Multi cursors Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-c>'
let g:multicursor_insert_maps=1
let g:multicursor_normal_maps=1

nnoremap <silent> <Leader>j :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <Leader>j :MultipleCursorsFind <C-R>/<CR>

" " Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
   exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

"highlight characters after 80 colun
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=16

" Indent line
let g:indentLine_enabled = 1

" Tmux mouse
if has('mouse')
set mouse+=a
  if &term =~ '^screen'
      " tmux knows the extended mouse mode
      set ttymouse=xterm2
  endif
endif

" force redraw when doing C-c to solve double lines display
nmap <C-c> :redraw!<CR>

set clipboard=unnamed

" Auto Detect GOPATH (used by gb to look into vendor directory)
let g:go_autodetect_gopath = 1
let g:syntastic_check_on_open = 1

au FileType go let $GOPATH = go#path#Detect()
