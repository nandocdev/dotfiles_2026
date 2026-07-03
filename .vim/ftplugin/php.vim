" ============================================================================
" CONFIGURACIONES ESPECÍFICAS PARA PHP
" ============================================================================

setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

" Autocmd para formatear PHP al guardar (con phpfmt o ALE)
autocmd BufWritePre *.php :ALEFix " Usar ALE para formatear (incluye phpfmt o phpcbf)

" Configuración para el plegado de código en PHP (opcional)
" setlocal foldmethod=syntax " Plegado por sintaxis
" setlocal foldlevel=1 " Nivel de plegado predeterminado

" Mapeos específicos de PHP
" Ejemplo: abrir un archivo Blade relacionado (requiere vim-fswitch o similar)
" nmap <buffer> <Leader>v :FSHere blade<CR>

" Atajo para correr un test PHP (si usas PHPUnit)
" nmap <buffer> <Leader>t :!./vendor/bin/phpunit %<CR> " Correr el archivo actual
" nmap <buffer> <Leader>T :!./vendor/bin/phpunit<CR> " Correr todos los tests