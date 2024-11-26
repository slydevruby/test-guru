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
badd +2 app/views/admin/passages/index.html.erb
badd +40 ~/projects/test-guru/app/models/passage.rb
badd +7 ~/projects/test-guru/app/controllers/admin/passages_controller.rb
badd +25 ~/projects/test-guru/app/views/layouts/admin.html.erb
badd +24 ~/projects/test-guru/app/views/layouts/application.html.erb
badd +6 ~/projects/test-guru/app/views/application/_tab_container.html.erb
badd +1 ~/projects/test-guru/app/controllers/admin/badges_controller.rb
badd +21 ~/projects/test-guru/app/models/award.rb
badd +1 ~/projects/test-guru/app/models/badge.rb
badd +26 app/controllers/passages_controller.rb
badd +1 health://
argglobal
%argdel
edit ~/projects/test-guru/app/models/award.rb
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
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
exe 'vert 1resize ' . ((&columns * 40 + 87) / 174)
exe 'vert 2resize ' . ((&columns * 124 + 87) / 174)
exe 'vert 3resize ' . ((&columns * 8 + 87) / 174)
argglobal
enew
file neo-tree\ filesystem\ \[1]
balt app/views/admin/passages/index.html.erb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
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
let s:l = 21 - ((20 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 21
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/projects/test-guru/app/models/passage.rb", ":p")) | buffer ~/projects/test-guru/app/models/passage.rb | else | edit ~/projects/test-guru/app/models/passage.rb | endif
if &buftype ==# 'terminal'
  silent file ~/projects/test-guru/app/models/passage.rb
endif
balt ~/projects/test-guru/app/models/award.rb
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
let s:l = 12 - ((0 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 12
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 40 + 87) / 174)
exe 'vert 2resize ' . ((&columns * 124 + 87) / 174)
exe 'vert 3resize ' . ((&columns * 8 + 87) / 174)
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
