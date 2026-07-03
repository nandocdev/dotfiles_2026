# ==================================================================== #
#  Zsh Configuration - env.zsh                                         #
#  Variables de entorno y configuración del PATH.                      #
# ==================================================================== #

# Fix the Java AWT problem (importante para algunas aplicaciones GUI de Java)
export _JAVA_AWT_WM_NONREPARENTING=1

# Gestión del PATH: Usar arreglos vinculados de ZSH para evitar duplicados automáticamente
typeset -U path # Asegura que el PATH solo contenga entradas únicas

# Definir las rutas en orden de prioridad (las de arriba tienen prioridad)
path=(
    $HOME/.local/bin
    $HOME/.config/composer/vendor/bin
    $HOME/.pyenv/bin
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
    /snap/bin
    /usr/sandbox/
    /opt/cleaner/
    $path
)

# Exportar el PATH final
export PATH

# Docker
export DOCKER_HOST=unix:///run/docker.sock

# Variables de entorno del editor
# Detecta automáticamente el editor preferido
if command -v nvim &> /dev/null; then
    export EDITOR="nvim"
    export VISUAL="nvim"
elif command -v vim &> /dev/null; then
    export EDITOR="vim"
    export VISUAL="vim"
elif command -v code &> /dev/null; then
    export EDITOR="code"
    export VISUAL="code"
else
    export EDITOR="nano"
    export VISUAL="nano"
fi

# Paginador por defecto
export PAGER="less"

# Configuración de idioma (opcional, descomentar si lo necesitas)
# export LANG="es_ES.UTF-8"
# export LC_ALL="es_ES.UTF-8"
# Configuración de pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# --- fzf Configuration ---
# Usar fd (mucho más rápido que find)
if command -v fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Tema Tokyo Night para fzf
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info \
--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7 \
--color=fg+:#ffffff,bg+:#2e3c64,hl+:#7dcfff \
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#bb9af7 \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"
