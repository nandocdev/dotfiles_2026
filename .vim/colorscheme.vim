" ============================================================================
" ESQUEMAS DE COLOR Y TEMAS
" ============================================================================

" Definición de temas, colores y configuraciones
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'soft'
set background=dark " Asegurar que el fondo sea oscuro

" Workaround para crear fondo transparente (se aplica después de cargar el esquema de color)
" Esta autocmd ya la movimos al init.vim para asegurar que se ejecute después del colorscheme.
" Si no funciona bien, puedes probar a ejecutarlo con un pequeño retardo o en otro evento.
" autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
"   \ | highlight LineNr guibg=NONE ctermbg=NONE
"   \ | highlight SignColumn guibg=NONE ctermbg=NONE

" Colores para los signos de ALE
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow