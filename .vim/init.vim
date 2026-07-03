" ============================================================================
" ARCHIVO PRINCIPAL DE CONFIGURACIÓN DE VIM
" Carga otras configuraciones modulares.
" ============================================================================

" Desactivar la compatibilidad con Vi para usar características modernas
set nocompatible

" Cargar configuraciones generales de Vim
source ~/.vim/general_settings.vim

" Configuración de Vim-Plug
" Si no tienes Vim-Plug instalado, descomenta y ejecuta :PlugInstall
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"   silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs '
"     \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.vim/plugged')

" Temas y Colores
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Explorador de Archivos y Navegación
Plug 'preservim/nerdtree'           " Explorador de sistema de archivos
Plug 'ryanoasis/vim-devicons'       " Iconos para NERDTree
Plug 'preservim/tagbar'             " Panel para mostrar etiquetas
Plug 'easymotion/vim-easymotion'    " Navegación rápida con atajos

" Edición y Comodidad
Plug 'sheerun/vim-polyglot'         " Soporte de idiomas y sangría
Plug 'jiangmiao/auto-pairs'         " Cierre automático de pares
Plug 'SirVer/ultisnips'             " Motor de snippets
Plug 'honza/vim-snippets'           " Snippets comunes
Plug 'preservim/vim-markdown'       " Resaltado y herramientas para Markdown

" Herramientas de Desarrollo
Plug 'dyng/ctrlsf.vim'              " Búsqueda asíncrona en el sistema de archivos
Plug 'w0rp/ale'                     " Linter y fixer asíncrono
Plug 'psf/black'                    " Formateador de Python (si sigues desarrollando Python)
Plug 'beanworks/vim-phpfmt'         " Formateador de PHP (¡ESENCIAL!)
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} " Fuzzy finder (¡MUY útil!)
Plug 'junegunn/fzf.vim'             " Integración de FZF con Vim
Plug 'vim-vdebug/vdebug'            " Depurador Xdebug para PHP
Plug 'jmcantrell/vim-virtualenv'    " Gestión de entornos virtuales (Python, pero puede ser útil)
Plug 'derekwyatt/vim-fswitch'       " Cambiar entre archivos relacionados (e.g., .php y .blade.php)
Plug 'derekwyatt/vim-protodef'      " Extraer prototipos de funciones (más para C/C++, pero puede adaptarse)
Plug 'github/copilot.vim'           " AI Copilot (¡Genial para sugerencias!)

" Plugins específicos de Laravel (¡NUEVO!)
Plug 'tpope/vim-dispatch'           " Ejecutar comandos asíncronos
" Plug 'php-actions/vim-laravel'      " Ayudas para Laravel (rutas, vistas, etc.)
Plug 'prettier/vim-prettier'          " Formateador de JS/CSS/HTML con Prettier
" Plug 'leafgarland/typescript-vim' " Si trabajas con TypeScript en el frontend
" Plug 'pangloss/vim-javascript'    " Mejor soporte para JavaScript
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Si quieres un LSP completo (más complejo de configurar)
Plug 'jwalton512/vim-blade'

call plug#end()

" Cargar configuraciones de plugins
source ~/.vim/plugin_settings.vim

" Cargar temas y esquemas de color
source ~/.vim/colorscheme.vim

" Cargar mapeos de teclas
source ~/.vim/keybindings.vim

" Cargar funciones personalizadas
source ~/.vim/autoload/myfunctions.vim

" Cargar configuraciones por tipo de archivo (ftplugin)
" Vim automáticamente carga archivos en ftplugin/ cuando el tipo de archivo cambia.
" No necesitamos 'source' explícitamente aquí, pero lo menciono para claridad.
filetype plugin indent on

" Autocmds generales (pueden ir aquí o en plugin_settings.vim si son muy específicos)
" Asegurar que el fondo transparente se aplique después de cargar el esquema de color
autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
  \ | highlight LineNr guibg=NONE ctermbg=NONE
  \ | highlight SignColumn guibg=NONE ctermbg=NONE

" Iniciar NERDTree al abrir Vim si no se especificó un archivo
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if !argc() && !exists("s:std_in") | NERDTree | endif
" Si un archivo es especificado o stdin, cambiar el foco al buffer del archivo
autocmd VimEnter * if argc() > 0 || exists("s:std_in") | wincmd p | endif
