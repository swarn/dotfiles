colorscheme gruvbox

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
hi! link cSpecial GruvboxAquaBold
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
hi! link cppRawStringDelimiter GruvboxAquaBold
hi! link cppStatement Normal
hi! link cppStorageClass Normal
hi! link cppStructure Normal
hi! link cppType Normal

" Coloring for clangd semantic groups
hi! link ClangdUnknown GruvboxRed

" Global variables
hi! link ClangdVariable GruvboxPurple
hi! link ClangdFunction Normal

hi! link ClangdStaticMemberFunction GruvboxOrange
hi! link ClangdStaticField GruvboxOrange

hi! link ClangdClass GruvboxAqua
hi! link ClangdMemberFunction GruvboxYellow
hi! link ClangdField GruvboxYellow

hi! link ClangdParameter GruvboxBlue
hi! link ClangdLocalVariable GruvboxGreen

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

