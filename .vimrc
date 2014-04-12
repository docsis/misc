"set mouse=a
syntax on
set hls       "highlight search 
set tabstop=4     "set the tab width to 4
set shiftwidth=4
set number
set autoindent
set wrap
"set fileformats=unix,dos
"set expandtab
set incsearch
set autoindent
set smartindent
colorscheme darkblue

set showcmd
set textwidth=100 "warp when more than 80 characters
set ruler
set laststatus=2 "show status in bottom

set paste

" Set to auto read when a file is changed from the outside
set autoread

set updatetime=1000

set fileencodings=utf-8,chinese
set encoding=utf-8

" auto complete
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>



function Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction


let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1


map   <C-S>   :w <CR>
"map   <C-V>   "+gP

map <F3> :bn <CR>
map <F2> :bp <CR>
map <F6> :NERDTreeToggle <CR>
map <F7> :Tlist<CR>

map <C-l> <C-w>l 
map <C-h> <C-w>h 
map <C-k> <C-w>k 
map <C-j> <C-w>j 


"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F5> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


