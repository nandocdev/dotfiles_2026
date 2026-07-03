" ============================================================================
" CONFIGURACIONES ESPECÍFICAS PARA PYTHON
" ============================================================================

setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

" Autoformateo con Black al guardar
autocmd BufWritePre *.py execute ':Black'

" Configuración para vim-virtualenv (Python)
let g:virtualenv_autoconda=1 " Detectar automáticamente entornos Conda

" Mapeo para activar/desactivar virtualenv
nmap <buffer> <Leader>ve :VirtualenvActivate<CR>
nmap <buffer> <Leader>vd :VirtualenvDeactivate<CR>

" Plantilla de Python
autocmd BufNewFile *.py 0r ~/.vim/templates/python_template.py | call SetTemplate()