# ==================================================================== #
#  Zsh Configuration - options.zsh                                     #
#  Opciones generales de Zsh, historial, y configuración del completado.
# ==================================================================== #

# ---------------------------------------------------- #
# Opciones de Historial                                #
# ---------------------------------------------------- #
HISTFILE="$HOME/.zsh_history" # Ubicación del archivo de historial
HISTSIZE=100000               # Número de comandos a mantener en el historial interno
SAVEHIST=100000               # Número de comandos a guardar en el archivo de historial

# Opciones para una mejor gestión del historial
setopt appendhistory          # Añade comandos al archivo de historial, no sobrescribe
setopt sharehistory           # Comparte el historial entre todas las sesiones de Zsh
setopt hist_ignore_dups       # No guarda comandos duplicados seguidos en el historial
setopt hist_ignore_space      # No guarda comandos que empiezan con un espacio (útil para comandos sensibles)
setopt hist_expire_dups_first # Elimina duplicados más antiguos primero al limpiar el historial
setopt hist_verify            # Pide confirmación antes de ejecutar un comando del historial modificado (e.g., `!ls`)
setopt hist_fcntl_lock        # Usa bloqueo de archivos para prevenir corrupción del historial

# ---------------------------------------------------- #
# Opciones Generales de Zsh                            #
# ---------------------------------------------------- #
setopt auto_cd                # Cambia a un directorio simplemente escribiendo su nombre
setopt auto_pushd             # Empuja el directorio anterior a la pila de directorios automáticamente
setopt pushd_ignore_dups      # No empuja directorios duplicados a la pila
# setopt pushd_minus_to_dirs    # Permite `cd -<N>` para saltar al N-ésimo directorio en la pila
setopt extended_glob          # Habilita globbing más potente (e.g., `rm **/*.bak(.))`)
setopt nomatch                # Previene errores si no se encuentra una coincidencia para el globbing
setopt no_beep                # No emite un "beep" en errores o autocompletado fallido
setopt interactive_comments   # Permite comentarios en el shell interactivo
setopt inc_append_history     # Añade comandos al archivo de historial inmediatamente (redundante con appendhistory pero seguro)
setopt correct                # Sugerir correcciones ortográficas para comandos
setopt auto_resume            # Tratar de reanudar procesos suspendidos al escribir su nombre

# ---------------------------------------------------- #
# Atajos de Teclado (Keybindings)                      #
# ---------------------------------------------------- #
# Usar atajos de teclado estilo Emacs (por defecto en Zsh, pero explícito es bueno)
bindkey -e
# O si prefieres atajos de teclado estilo Vi (descomentar si quieres vi-mode)
# bindkey -v

# ---------------------------------------------------- #
# Sistema de Completado (Completion System)            #
# ---------------------------------------------------- #

# Inicializar el potente sistema de completado de Zsh.
# Oh My Zsh ya lo hace, así que lo comentamos aquí para evitar redundancia y mejorar el tiempo de carga.
# autoload -Uz compinit
# compinit -C # -C previene una advertencia de seguridad común en la primera ejecución.

# Estilos de completado (tus configuraciones existentes, con algunas adiciones comunes)
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors '' # Deja que LS_COLORS maneje los colores
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

# Para colorear las sugerencias de `ls` en el completado
eval "$(dircolors -b)" # Asegura que LS_COLORS esté configurado desde dircolors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Completado específico para el comando `kill` (tu configuración original es buena)
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'