let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/projects/test-guru
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +11 app/views/badges/_badge.html.erb
badd +10 ~/projects/test-guru/app/views/badges/index.html.erb
badd +43 app/controllers/passages_controller.rb
badd +8 app/views/awards/_award.html.erb
badd +17 ~/.config/nvim/lua/plugins/none.lua
argglobal
%argdel
edit app/views/badges/_badge.html.erb
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
3wincmd k
wincmd w
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 15 + 32) / 65)
exe '2resize ' . ((&lines * 20 + 32) / 65)
exe '3resize ' . ((&lines * 10 + 32) / 65)
exe '4resize ' . ((&lines * 15 + 32) / 65)
argglobal
balt ~/projects/test-guru/app/views/badges/index.html.erb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 051|
wincmd w
argglobal
enew | setl bt=help
help session-file@en
balt ~/.config/nvim/lua/plugins/none.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let &fdl = &fdl
let s:l = 790 - ((0 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 790
normal! 059|
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/plugins/none.lua", ":p")) | buffer ~/.config/nvim/lua/plugins/none.lua | else | edit ~/.config/nvim/lua/plugins/none.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/plugins/none.lua
endif
balt app/controllers/passages_controller.rb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 17 - ((6 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("app/views/awards/_award.html.erb", ":p")) | buffer app/views/awards/_award.html.erb | else | edit app/views/awards/_award.html.erb | endif
if &buftype ==# 'terminal'
  silent file app/views/awards/_award.html.erb
endif
balt ~/projects/test-guru/app/views/badges/index.html.erb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 8 - ((7 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 01|
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 15 + 32) / 65)
exe '2resize ' . ((&lines * 20 + 32) / 65)
exe '3resize ' . ((&lines * 10 + 32) / 65)
exe '4resize ' . ((&lines * 15 + 32) / 65)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
