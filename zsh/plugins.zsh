# ==================================================================== #
#  Zsh Configuration - plugins.zsh                                     #
#  Carga de Oh My Zsh y gestión de plugins.                            #
# ====================================================================

# ---------------------------------------------------- #
# Oh My Zsh Framework                                  #
# ---------------------------------------------------- #
# ZSH define la ruta de instalación de Oh My Zsh (ya está definido en zshrc.zsh)

# Lista de plugins de Oh My Zsh
# Cada plugin listado aquí será cargado por Oh My Zsh.
# Añade o elimina plugins según tus necesidades.
plugins=(
    git                 # Integración con Git
    docker              # Completado para Docker
    docker-compose      # Completado para docker-compose
    npm                 # Completado para npm
    node                # Completado para Node.js
    python              # Completado para Python
    pip                 # Completado para pip
    sudo                # Presiona ESC dos veces para añadir sudo al comando anterior
    colored-man-pages   # Páginas de manual con colores
    command-not-found   # Sugiere paquetes cuando un comando no se encuentra
    extract             # Extrae archivos comprimidos fácilmente
    z                   # Navegación rápida entre directorios
    zsh-autosuggestions # Sugerencias automáticas basadas en historial
    zsh-syntax-highlighting # Resaltado de sintaxis en tiempo real
)

# Nota: Los plugins zsh-autosuggestions y zsh-syntax-highlighting deben estar
# instalados manualmente si no están incluidos con Oh My Zsh:
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# ---------------------------------------------------- #
# Carga Manual de Plugins Adicionales                 #
# ---------------------------------------------------- #
# Para plugins que no son gestionados por Oh My Zsh, o si quieres usar las últimas versiones
# directamente de sus repositorios de Git.
# Es una buena práctica clonarlos en ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/

# Configuración de fzf (asegúrate de que fzf esté instalado y su script de Zsh esté cargado)
# Este script es generalmente generado por `~/.fzf/install`
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Integración de direnv (si está instalado)
# eval "$(direnv hook zsh)"
