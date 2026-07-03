" ============================================================================
" CONFIGURACIONES DE PLUGINS
" ============================================================================

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows = 1 " Mostrar flechas para directorios
let g:NERDTreeMinimalUI = 0 " Interfaz completa (cambiar a 1 para mínima)
let g:NERDTreeMouseMode = 2 " Habilitar clic del ratón
let g:NERDTreeShowBookmarks = 1 " Mostrar bookmarks

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_position = 'right' " Posición a la derecha
let g:tagbar_width = 30 " Ancho del panel
let g:tagbar_sort = 0 " No ordenar etiquetas (mantener orden de archivo)

" ALE (Asynchronous Linting and Fixing)
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'normal' " Lint al cambiar texto (más rápido)
let g:ale_lint_on_insert_leave = 1 " Lint al salir del modo inserción
let g:ale_fix_on_save = 1 " Arreglar automáticamente al guardar (¡MUY útil!)

" Linters y Fixers específicos para PHP y Laravel
let g:ale_linters = {
\   'php': ['phpcs', 'phpstan', 'builtin_php'],
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'html': ['htmlhint'],
\}

let g:ale_fixers = {
\   'php': ['phpcbf', 'phpfmt'],
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'html': ['prettier'],
\}

" Configuración de PHPCS y PHP-CS-Fixer para ALE
" Asegúrate de tenerlos instalados globalmente o vía Composer
" composer global require squizlabs/php_codesniffer
" composer global require friendsofphp/php-cs-fixer
let g:ale_php_phpcs_standard = 'PSR12' " O 'PSR2', 'Laravel', etc.
let g:ale_php_phpcbf_standard = 'PSR12'

" PHP-FMT (Controlado por ALE)
let g:phpfmt_standard = 'PSR12' " PSR12 es una buena opción para PHP moderno
let g:phpfmt_autosave = 0 " Desactivado. ALE se encarga del formateo al guardar.

" FZF
let g:fzf_command_prefix = 'Fzf' " Prefijo para comandos de FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tabnew',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Vim-Vdebug (Xdebug)
" ¡ACCIÓN REQUERIDA! Para usar el depurador, añade la entrada 'path_maps' a las opciones de vdebug.
" Ejemplo:
" let g:vdebug_options = {
" \   'port': 9003,
" \   'path_maps': {
" \       '/ruta/en/servidor': '/ruta/en/local',
" \   },
" \}
let g:vdebug_options = {
\   'port': 9003,
\   'debug_window_height': 10,
\   'server': '127.0.0.1',
\}


" Vim-Laravel
" Configuraciones específicas de Laravel si las necesitas.
" Por ejemplo, para abrir rutas, controladores, etc.
" nmap <leader>lr :Laravel<CR> " Ejemplo, puedes mapear esto en keybindings.vim

" Vim-Prettier (Controlado por ALE)
let g:prettier#autoformat = 0 " Desactivado. ALE se encarga del formateo al guardar.
let g:prettier#config = {
  \ 'singleQuote': v:true,
  \ 'semi': v:false,
  \ 'trailingComma': 'es5',
  \ 'printWidth': 100,
\}

" Copilot
" Puedes configurar aquí atajos o comportamientos de Copilot si lo necesitas.
" Por ejemplo:
" imap <C-S-c> <Plug>(copilot-suggest) " Sugerencia manual
" imap <C-S-f> <Plug>(copilot-next) " Siguiente sugerencia
" imap <C-S-b> <Plug>(copilot-previous) " Sugerencia anterior