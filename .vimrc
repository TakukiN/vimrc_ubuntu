" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'rking/ag.vim'

call neobundle#end()

filetype plugin indent on

"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]


"現在開いているファイルのディレクトリ下のファイル一覧。
""開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
""レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
""ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"
nnoremap <silent> [unite]o :<C-u>Unite -no-quit -vertical -winwidth=40 outline<CR>


let g:ag_prg="/usr/bin/ag"
let g:ag_working_path_mode="r"

let g:ackprg = 'ag --nogroup --nocolor --column'


if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif

"------------------------------------
"" Unit.vim
"------------------------------------
"" 入力モードで開始する
let g:unite_enable_start_insert=1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" " grep検索
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" " ディレクトリを指定してgrep検索
nnoremap <silent> ,dg :<C-u>Unite grep:expand("%:h") -buffer-name=search-buffer<CR>
"  " カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
"  " grep検索結果の再呼出
nnoremap <silent> ,r :<C-u>UniteResume search-buffer<CR>
"  " unite grep に ag(The Silver Searcher) を使う
"
"  " Use ag (the silver searcher)
"  " https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif



