" Vim color file

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "daybreak"

hi Normal     ctermfg=White ctermbg=none guifg=White guibg=grey20
hi NonText    term=bold     ctermfg=LightBlue    gui=none guifg=LightBlue guibg=grey30
hi Question   term=standout ctermfg=LightGreen   gui=none guifg=Green
hi SpecialKey term=bold     ctermfg=LightBlue    guifg=#888888
hi Title      term=bold     ctermfg=Magenta  gui=none guifg=Magenta
hi WildMenu   term=standout ctermfg=Black    ctermbg=Yellow    guifg=Black    guibg=Yellow

" �V�X�e�����b�Z�[�W
hi ErrorMsg   term=standout ctermfg=White    ctermbg=DarkRed guifg=White guibg=Red
hi WarningMsg term=standout ctermfg=LightRed                 guifg=Red
hi ModeMsg    term=bold cterm=bold gui=none
hi MoreMsg    term=bold     ctermfg=LightGreen   gui=none guifg=SeaGreen

" �܂肽����
hi Folded     term=standout ctermfg=DarkBlue ctermbg=LightGrey guifg=DarkBlue guibg=LightGrey
hi FoldColumn term=standout ctermfg=DarkBlue ctermbg=LightGrey guifg=DarkBlue guibg=Grey

" �f�B���N�g��
hi Directory term=bold ctermfg=LightCyan guifg=Cyan

" ������
hi Search    term=reverse ctermbg=Yellow ctermfg=Black guibg=#666600 guifg=White
hi IncSearch term=reverse ctermbg=Yellow ctermfg=White guibg=#888888 guifg=White gui=none

" �r�W���A�����[�h
hi Visual    term=reverse        ctermfg=Grey ctermbg=fg gui=reverse        guifg=Grey guibg=fg
hi VisualNOS term=underline,bold cterm=underline,bold    gui=underline,bold 

" �����\��
hi DiffText   term=reverse cterm=bold ctermbg=Red      gui=none guibg=Red
hi DiffAdd    term=bold               ctermbg=DarkBlue          guibg=DarkBlue
hi DiffChange term=bold               ctermbg=DarkMagenta       guibg=DarkMagenta
hi DiffDelete term=bold  ctermfg=Blue ctermbg=DarkCyan gui=none guibg=DarkCyan guifg=Blue

" Groups for syntax highlighting
hi Constant  term=underline  ctermfg=Magenta         guifg=Orange guibg=grey20
hi Special   term=bold       ctermfg=Cyan            guifg=Cyan   guibg=grey20
hi Statement term=bold       cterm=none ctermfg=Cyan guifg=Cyan    gui=none
hi Ignore    ctermfg=DarkGrey                        guifg=grey20
hi Type      term=underline  ctermfg=LightGreen      guifg=#60ff60 gui=none
hi PreProc   term=underline  ctermfg=darkblue        guifg=#ff80ff gui=none

" �X�N���v�g�Ή�
hi phpFunctions term=standout ctermfg=LightGreen gui=none guifg=Cyan
hi Comment      term=bold     ctermfg=DarkGrey   guifg=grey60

" �s�ԍ��E�X�e�[�^�X���C���E�������C��
hi LineNr       term=underline ctermfg=White ctermbg=Grey gui=none guifg=White   guibg=#555555
hi StatusLine   term=underline ctermfg=White ctermbg=none gui=none guifg=White   guibg=#555555
hi StatusLineNC term=underline ctermfg=White ctermbg=Grey gui=none guifg=#aaaaaa guibg=#555555
hi VertSplit    term=reverse   ctermfg=White ctermbg=Grey gui=none guifg=White   guibg=#555555

" �J�[�\���̐F
hi Cursor    guibg=Green guifg=Black
hi lCursor   guibg=Cyan  guifg=Black

" ���{�����ON���̃J�[�\���̐F��ݒ�
if has('multi_byte_ime') || has('xim')
   highlight CursorIM guibg=Purple guifg=NONE
endif

" �S�p�X�y�[�X�̐F��ύX
hi ZenkakuSpace ctermbg=Grey guibg=grey30
match ZenkakuSpace /�@/

" vim: sw=2

