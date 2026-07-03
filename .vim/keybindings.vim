" ============================================================================
" MAPPING DE TECLAS
" ============================================================================

let mapleader=" " " El líder es la barra espaciadora

" Navegación y Exploración
nmap <Leader>n :NERDTreeToggle<CR>             " Alternar NERDTree
nmap <Leader>nf :NERDTreeFind<CR>              " Encontrar el archivo actual en NERDTree
nmap <Leader>t :TagbarToggle<CR>               " Alternar Tagbar
nmap <Leader>s <Plug>(easymotion-s2)           " EasyMotion para saltar rápido
nmap <Leader>f :FzfFiles<CR>                   " Abrir FZF para buscar archivos (¡MUY útil!)
nmap <Leader>g :FzfGrep<CR>                    " Abrir FZF para buscar texto en archivos
nmap <Leader>b :FzfBuffers<CR>                 " Abrir FZF para cambiar de buffer
nmap <Leader>h :FzfHistory<CR>                 " Abrir FZF para historial de comandos

" Terminal Integrado
nmap <Leader>tv :botright vnew <Bar> :terminal <CR> " Terminal vertical
nmap <Leader>th :botright new <Bar> :terminal <CR>  " Terminal horizontal
nmap <Leader>tp :botright vnew <Bar> :terminal php artisan serve<CR> " Iniciar servidor Laravel
nmap <Leader>tps :botright vnew <Bar> :terminal php artisan tinker<CR> " Abrir Tinker

" Acciones de Archivos
nmap <Leader>w :w<CR>                          " Guardar
nmap <Leader>q :q<CR>                          " Salir
nmap <Leader>wq :wq<CR>                        " Guardar y salir
nmap <Leader>x :bd<CR>                         " Cerrar buffer actual

" Depuración (Vdebug)
nmap <F5> :VdebugStart<CR>                     " Iniciar depuración
nmap <F6> :VdebugStop<CR>                      " Detener depuración
nmap <F7> :VdebugStepOver<CR>                  " Paso sobre
nmap <F8> :VdebugStepInto<CR>                  " Paso dentro
nmap <F9> :VdebugStepOut<CR>                   " Paso fuera
nmap <F10> :VdebugGo<CR>                       " Continuar
nmap <F11> :VdebugBreakpoint<CR>               " Toggle breakpoint

" Gestión de dependencias (Ejemplo, puede ser más específico para Composer)
nmap <Leader>cinst :!composer install<CR>      " Instalar dependencias de Composer
nmap <Leader>cupd :!composer update<CR>        " Actualizar dependencias de Composer
nmap <Leader>cdump :!composer dump-autoload<CR> " Regenerar autoload

" Acciones de Laravel (Ejemplos, ajusta según tus necesidades)
nmap <Leader>art :terminal php artisan<CR>     " Abrir terminal con php artisan
nmap <Leader>mig :!php artisan migrate<CR>     " Ejecutar migraciones
nmap <Leader>seed :!php artisan db:seed<CR>    " Ejecutar seeders
nmap <Leader>make :!php artisan make:<CR>      " Placeholder para make:command, make:controller, etc.
nmap <Leader>rout :LaravelRouteList<CR>        " Ver lista de rutas (requiere vim-laravel)

" UltiSnips
smap <C-Space> <Plug>UltiSnipsExpandOrJump " Expandir o saltar con Ctrl+Espacio

" Formateo
nmap <Leader>fmt :ALEFix<CR>                   " Ejecutar fixers de ALE
nmap <Leader>pfmt :PHPCSFixer<CR>              " Formatear con PHP-CS-Fixer (si lo tienes)

" FSwitch (Para cambiar entre archivos de implementación y encabezado, o relacionados)
" Puede ser útil para PHP si tienes, por ejemplo, un archivo de controlador y su vista.
nmap <leader>fs :FSHere<CR>