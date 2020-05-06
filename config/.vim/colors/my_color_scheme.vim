"%% SiSU Vim color file
" Slate Maintainer: Ralph Amissah <ralph@amissah.com>
" (originally looked at desert Hans Fugal <hans@fugal.net> http://hans.fugal.net/vim/colors/desert.vim (2003/05/06)
:set background=dark
:highlight clear
if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif

let colors_name = "my_color_scheme"
:hi Normal guifg=White 
:hi clear Cursor guibg=khaki guifg=slategrey
:hi clear CursorLine guibg=NONE
:hi clear CursorLineNR guifg=#FFFFFF ctermfg=white
:hi VertSplit guibg=#c2bfa5 guifg=grey40 gui=none cterm=reverse
:hi Folded guibg=black guifg=grey40 ctermfg=grey ctermbg=darkgrey
:hi FoldColumn guibg=black guifg=grey20 ctermfg=4 ctermbg=7
:hi IncSearch guifg=green guibg=black cterm=none ctermfg=yellow ctermbg=green
:hi ModeMsg guifg=#1cccd9
:hi MoreMsg guifg=#1884ab ctermfg=darkgreen
:hi NonText guifg=RoyalBlue cterm=bold ctermfg=blue
:hi Question guifg=springgreen ctermfg=green
:hi Search guibg=peru guifg=wheat cterm=none ctermfg=grey ctermbg=blue
:hi SpecialKey guifg=yellowgreen ctermfg=darkgreen
:hi StatusLine guibg=#c2bfa5 guifg=black gui=none cterm=bold,reverse
:hi StatusLineNC guibg=#c2bfa5 guifg=grey40 gui=none cterm=reverse
:hi Title guifg=gold gui=bold cterm=bold ctermfg=yellow
:hi Statement guifg=#8482ff ctermfg=lightblue
:hi Visual gui=none guifg=khaki guibg=olivedrab cterm=reverse
:hi WarningMsg guifg=salmon ctermfg=1
:hi String guifg=#daadff ctermfg=cyan
:hi Comment term=bold ctermfg=206 guifg=#d4f2b1
:hi Constant guifg=#67e9f0 ctermfg=42
:hi Special guifg=#b3adff ctermfg=111
:hi Identifier guifg=#6cf5ee ctermfg=141
:hi Include guifg=CornflowerBlue ctermfg=141
:hi PreProc guifg=#6cf5ee ctermfg=141
:hi Operator guifg=#acbcfc ctermfg=45
:hi Define guifg=gold gui=bold ctermfg=yellow
:hi Type guifg=#67e9f0 ctermfg=177
:hi Function guifg=#a1e6ff ctermfg=37
:hi Structure guifg=green ctermfg=green
:hi LineNr guifg=#6e74b5 ctermfg=38
:hi Ignore guifg=grey40 cterm=bold ctermfg=7
:hi Todo guifg=orangered guibg=yellow2
:hi Directory ctermfg=darkcyan
:hi ErrorMsg cterm=bold guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
:hi VisualNOS cterm=bold,underline
:hi WildMenu ctermfg=0 ctermbg=3
:hi DiffAdd ctermbg=4
:hi DiffChange ctermbg=5
:hi DiffDelete cterm=bold ctermfg=4 ctermbg=6
:hi DiffText cterm=bold ctermbg=1
:hi Underlined cterm=underline ctermfg=5
:hi Error guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
:hi SpellErrors guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
:hi Visual guifg=#e3eeff guibg=#0b1b36
:hi clear VertSplit guibg=NONE
