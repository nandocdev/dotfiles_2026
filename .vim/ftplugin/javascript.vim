" ============================================================================
" CONFIGURACIONES ESPECÍFICAS PARA JAVASCRIPT
" ============================================================================

setlocal expandtab
setlocal tabstop=2 " 2 espacios es común en JS
setlocal shiftwidth=2
setlocal softtabstop=2

" Autoformateo con Prettier al guardar
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.vue,*.json,*.css,*.scss,*.less,*.html,*.md :Prettier<CR>

" Configuración de linter para JS (ALE)
let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint']