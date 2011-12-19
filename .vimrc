set hls       "highlight search 
set tabstop=4     "set the tab width to 4
set shiftwidth=4
set number
set autoindent
set wrap
"set fileformats=unix,dos
set expandtab
set incsearch
set autoindent
set smartindent

set showcmd
set textwidth=80 "warp when more than 80 characters
set ruler
set laststatus=2 "show status in bottom

set paste

" Set to auto read when a file is changed from the outside
set autoread

set updatetime=1000

"set fileencodings=utf-8,chinese
"set encoding=utf-8

function Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction


let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1


map   <C-S>   :w <CR>
map   <C-V>   "+gP

map   <F2>   :bn <CR>
map   <F3>   :bp <CR>
map <F7> : Tlist<CR>



