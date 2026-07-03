" ============================================================================
" CONFIGURACIONES ESPECÍFICAS PARA CSS/SCSS/LESS
" ============================================================================

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" Autoformateo con Prettier al guardar
autocmd BufWritePre *.css,*.scss,*.less :Prettier<CR>

" Linter para CSS (ALE)
let b:ale_linters = ['stylelint']
let b:ale_fixers = ['stylelint', 'prettier']
