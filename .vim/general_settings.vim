" ============================================================================
" CONFIGURACIONES GENERALES DE VIM
" ============================================================================

" Mostrar números de línea absolutos y relativos
set number
set relativenumber

" Habilitar el uso del ratón en todos los modos
set mouse=a

" Ancho de la columna de números de línea
set numberwidth=4 " Aumentado a 4 para más espacio si los números son largos

" Copiar/Pegar con el portapapeles del sistema
set clipboard=unnamedplus

" Resaltado de sintaxis
syntax on

" Mostrar el comando parcial en la barra de estado
set showcmd

" Mostrar la regla de posición del cursor
set ruler

" Codificación de caracteres (siempre UTF-8)
set encoding=utf8

" Resaltar automáticamente los paréntesis, corchetes y llaves coincidentes
set showmatch

" Ancho de indentación (para Laravel, 4 espacios es estándar)
set sw=4
set ts=4 " También el tamaño de tabulación
set expandtab " Convertir tabs a espacios

" Siempre mostrar la barra de estado
set laststatus=2

" No mostrar el modo actual (Insert, Normal, etc.)
" La barra de estado ya lo indica o se puede inferir
set noshowmode

" Retroceso inteligente
set backspace=indent,eol,start

" Indentación automática
set autoindent
set smartindent

" Redibujar la pantalla solo cuando sea necesario (mejora el rendimiento)
set lazyredraw

" Mejoras visuales
set cursorline " Resaltar la línea actual
" set cursorcolumn " Resaltar la columna actual (puede ser molesto, opcional)
set scrolloff=8 " Mantener 8 líneas de contexto al mover el cursor
set wrap " Envolver líneas largas
set linebreak " Envolver líneas en límites de palabras
set textwidth=0 " No forzar el ancho de texto (los linters se encargan de esto)

" Buscar
set incsearch " Búsqueda incremental
set hlsearch " Resaltar todas las coincidencias de búsqueda
set ignorecase " Ignorar mayúsculas/minúsculas en la búsqueda
set smartcase " Usar mayúsculas/minúsculas en la búsqueda si hay mayúsculas en el patrón

" Comandos del historial
set history=1000 " Guardar 1000 comandos en el historial

" Mejoras en el rendimiento
set updatetime=300 " Tiempo para escribir swp y actualizar la pantalla (ms)
" set readahead=700 " Leer más bytes adelante para mejorar el rendimiento de lectura
set ttimeoutlen=100 " Tiempo de espera para los mapeos de teclado

" Dividir ventanas horizontalmente debajo y verticalmente a la derecha
set splitbelow
set splitright
