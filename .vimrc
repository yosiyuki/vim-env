" ------------------------------
" スワップファイル・バックアッ
" ------------------------------
set backup
set backupdir=~/.vim/vim_backup
set swapfile
set directory=~/.vim/vim_swap

" ------------------------------
" 環境設定
" ------------------------------
set nu
set ts=4 sw=4 sts=4
set expandtab
set hidden
set autoindent
set sm
set listchars=tab:^\ ,trail:-
set list
set wildmode=list:full
set clipboard+=unnamed
set nocp
set incsearch
set ignorecase
set smartcase
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set cindent
set nowrapscan
set nrformats-=octal
set backspace=indent,eol,start
set viminfo+=f1
" set foldmethod=marker
set display=lastline
set modeline

" ------------------------------
" ステータスラインの設定
" ------------------------------
set laststatus=2
set cmdheight=2
set showcmd
set statusline=%<%n:%t\ \<%F\>\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" ------------------------------
" マウスで選択した部分をクリップボードに貼り付ける
" ------------------------------
"set guioptions+=a

" ------------------------------
" 最終行に勝手に改行をつけない
" ------------------------------
"set binary noeol

" ------------------------------
" タグファイルを読み込み
" ------------------------------
set tags+=tags;

" ------------------------------
" シンタックスカラーの使用
" ------------------------------
set t_Co=256
syntax on
colorscheme desert256

" ------------------------------
" 日本語入力に関する設定:
" ------------------------------
if has('multi_byte_ime') || has('xim')
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " kinput2+canna用の設定:
    set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

" ------------------------------
" ■キーマップ
" ------------------------------
" ------------------------------
" ノーマルモード時
" ------------------------------
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
nnoremap j gj
nnoremap k gk
nnoremap <C-J> 5j
nnoremap <C-K> 5k
nnoremap <C-H> 5h
nnoremap <C-L> 5l
nnoremap ' `
nnoremap <C-M> @m
nnoremap Y y$
nnoremap <C-]> g<C-]>
nnoremap n nzz
nnoremap N Nzz

" ------------------------------
" 文法チェック
" ------------------------------
"autocmd FileType php :nnoremap <down> :!php -l %<cr>

" ------------------------------
" 実行
" ------------------------------
"autocmd FileType php :nnoremap <up> :!php %<cr>

" ------------------------------
" ファイルタイプを設定
" ------------------------------
" CakePHPのビュー
au BufRead,BufNewFile *.thtml set filetype=php
au BufRead,BufNewFile *.erb set filetype=html

" ------------------------------
" 最後にヤンクしたデータを貼り付ける
" ------------------------------
nnoremap p <S-">0p
nnoremap P <S-">0P
" ddはヤンクとみなす
nnoremap dd <S-">0dd
" vnoremap d <S-">0d

" ------------------------------
" 削除した場合、それぞれのキーに対応したレジスタに格納する
" ------------------------------
"nnoremap cw <S-">wcw
"nnoremap dw <S-">wdw
"nnoremap ce <S-">ece
"nnoremap de <S-">ede
"nnoremap x <S-">xx
"nnoremap X <S-">xX

" ------------------------------
" インサートモード時
" ------------------------------
inoremap <C-TAB> <C-V><TAB>
inoremap <C-F> <C-R>=expand('%:p')<CR>
" インサート中に誤ってエンターを押してしまったときは C-b
inoremap <C-b> <Esc>kA

" ------------------------------
" コマンドモード時
" ------------------------------
"cnoremap <C-P> <C-R>=expand('%:p:h')<CR>
cnoremap <C-B>	<LEFT>
cnoremap <C-F>	<RiGHT>

" ------------------------------
" ■文字コード識別
" 下記より引用させていただきました
" http://www.kawaz.jp/pukiwiki/?vim
" ------------------------------
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" ------------------------------
" プラグインの設定
" ------------------------------
" ■読み込まないプラグイン
let plugin_dicwin_disable = 1

" ■MiniBufExplorerの設定
let g:miniBufExplMapWindowNavVim    = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplVSplit             = 1
let g:miniBufExplMaxSize            = 20
let g:miniBufExplMinSize            = 20
let g:miniBufExplorerMoreThanOne    = 0
let g:miniBufExplMapCTabSwitchBuffs = 1

set cursorline
"set guibg=Purple
"set guifg=NONE
"set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o;hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
"
