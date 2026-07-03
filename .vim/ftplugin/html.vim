" ============================================================================
" CONFIGURACIONES ESPECÍFICAS PARA HTML (incluye Blade)
" ============================================================================

setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

" Autoformateo con Prettier al guardar (para HTML y Blade)
autocmd BufWritePre *.html,*.blade.php :Prettier<CR>

" Linter para HTML (ALE)
let b:ale_linters = ['htmlhint']
let b:ale_fixers = ['prettier']