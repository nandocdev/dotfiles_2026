" ============================================================================
" FUNCIONES PERSONALIZADAS
" ============================================================================

" Función para establecer plantillas
function! SetTemplate()
    " Obtiene el nombre del archivo sin extensión
    let l:module_name = expand('%:t:r')

    " Obtiene la fecha actual
    let l:date = strftime("%Y-%m-%d")

    " Reemplaza los placeholders en el template
    execute '%s/<MODULE_NAME>/' . l:module_name . '/g'
    execute '%s/<DATE>/' . l:date . '/g'
endfunction

" Nueva función para plantillas de PHP
function! SetPhpTemplate()
    " Obtiene el nombre del archivo sin extensión (quita .php)
    let l:class_name = expand('%:t:r')
    " Capitaliza la primera letra si no lo está (para nombres de clase)
    let l:class_name = toupper(strpart(l:class_name, 0, 1)) . strpart(l:class_name, 1)

    " Obtiene la fecha actual
    let l:date = strftime("%Y-%m-%d")

    " Reemplaza los placeholders en el template
    execute '%s/<MODULE_NAME>/' . l:class_name . '/g'
    execute '%s/<DATE>/' . l:date . '/g'
endfunction

" Autocmd para PHP para usar la nueva plantilla
autocmd BufNewFile *.php 0r ~/.vim/templates/php_class_template.php | call SetPhpTemplate()