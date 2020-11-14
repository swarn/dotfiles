runtime colors/gruvbox.vim

" Instead of GruvboxGray, use slighly lighter GruvBoxFg4, with italic
highlight! Comment guifg=#a89984 ctermfg=246 guibg=NONE ctermbg=NONE gui=italic cterm=italic

" Fade GitGutter into the background
highlight! link GitGutterAdd LineNr
highlight! link GitGutterChange LineNr
highlight! link GitGutterDelete LineNr
highlight! link GitGutterChangeDelete LineNr

" telescope.nvim
highlight! link TelescopeBorder GruvboxBlue
highlight! link TelescopeMatching GruvboxYellow

" Disable tons of C and C++ highlighting. Maybe write a custom sytax file for
" semantic highlighting, taking advantage of treesitter?
hi! link PreProc Normal
hi! link Include Normal
hi! link Define Normal
hi! link Macro Normal
hi! link PreCondit Normal

hi! link cBlock Normal
hi! link cBracket Normal
hi! link cConditional Normal
hi! link cDefine Normal
hi! link cFloat Normal
hi! link cInclude Normal
hi! link cIncluded Normal
hi! link cLabel Normal
hi! link cNumber Normal
hi! link cNumbers Normal
hi! link cOctalError Normal
hi! link cOperator Normal
hi! link cPreCondit Normal
hi! link cPreConditMatch Normal
hi! link cPreProc Normal
hi! link cRepeat Normal
hi! link cSpecial GruvboxYellow
hi! link cStatement Normal
hi! link cStorageClass Normal
hi! link cString GruvboxAqua
hi! link cStructure Normal
hi! link cType Normal

hi! link cppAccess Normal
hi! link cppBoolean Normal
hi! link cppCast Normal
hi! link cppConstant Normal
hi! link cppExceptions Normal
hi! link cppModifier Normal
hi! link cppNumber Normal
hi! link cppOperator Normal
hi! link cppRawString GruvboxAqua
hi! link cppRawStringDelimiter GruvboxAqua
hi! link cppStatement Normal
hi! link cppStorageClass Normal
hi! link cppStructure Normal
hi! link cppType Normal

" Coloring for vim-lsp-cxx-highlight groups
hi! link LspCxxHlSymUnknown Normal
hi! link LspCxxHlSymVariable GruvboxRed
hi! link LspCxxHlSymFunction GruvboxYellow
hi! link LspCxxHlSymStaticMethod GruvboxOrange
hi! link LspCxxHlSymUnknownStaticField GruvboxOrange
hi! link LspCxxHlSymClass GruvboxAqua
hi! link LspCxxHlSymStruct GruvboxAqua
hi! link LspCxxHlSymMethod GruvboxGreen
hi! link LspCxxHlSymField GruvboxGreen
hi! link LspCxxHlSymParameter GruvboxPurple
hi! link LspCxxHlSymLocalVariable GruvboxBlue
hi! link LspCxxHlSymMacro Normal
hi! link LspCxxHlSymNamespace Normal
hi! link LspCxxHlSymDependentName Normal
hi! link LspCxxHlSymConcept Normal
hi! link LspCxxHlSymDependentType Normal
hi! link LspCxxHlSymEnum Normal
hi! link LspCxxHlSymEnumConstant Normal
hi! link LspCxxHlSymTypeAlias Normal
hi! link LspCxxHlSymTypeParameter Normal
hi! link LspCxxHlSymTypedef Normal
hi! link LspCxxHlSymTemplateParameter Normal
hi! link LspCxxHlSymPrimitive Normal
hi! link LspCxxHlSymEnumConstant Normal
hi! link LspCxxHlSkippedRegion Normal
hi! link LspCxxHlSkippedRegionBeginEnd Normal

" coloring for clangd-nvim highlighting groups
hi! link ClangdUnknown Normal
hi! link ClangdVariable GruvboxRed
hi! link ClangdFunction GruvboxYellow
hi! link ClangdStaticMemberFunction GruvboxOrange
hi! link ClangdStaticField GruvboxOrange
hi! link ClangdClass GruvboxAqua
hi! link ClangdMemberFunction GruvboxGreen
hi! link ClangdField GruvboxGreen
hi! link ClangdParameter GruvboxPurple
hi! link ClangdLocalVariable GruvboxBlue
hi! link ClangdPreprocessor Normal
hi! link ClangdNamespace Normal
hi! link ClangdDependentName Normal
hi! link ClangdConcept Normal
hi! link ClangdDependentType Normal
hi! link ClangdEnum Normal
hi! link ClangdTypedef Normal
hi! link ClangdTemplateParameter Normal
hi! link ClangdPrimitive Normal
hi! link ClangdEnumConstant Normal
hi! link ClangdInactiveCode Normal
