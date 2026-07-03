# ─────────────────────────────────────────────
# 🧠 Configuración principal de ZSH
# ─────────────────────────────────────────────

# Ruta a Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Tema (puede estar sobreescrito en prompt.zsh si usas Powerlevel10k)

# ─────────────────────────────────────────────
# 📦 Carga modular de configuración
# ─────────────────────────────────────────────

# Ruta donde guardas los módulos separados
ZSH_CONFIG_DIR="$HOME/.config/zsh"

# Cargar los módulos en un orden lógico.
# El orden es importante para que las variables y opciones estén disponibles antes de que los plugins y aliases los usen.
source "$ZSH_CONFIG_DIR/env.zsh"      # Variables de entorno y PATH
source "$ZSH_CONFIG_DIR/options.zsh"  # Opciones generales de Zsh, historial, y completado
source "$ZSH_CONFIG_DIR/plugins.zsh"  # Carga de Oh My Zsh y plugins
source "$ZSH_CONFIG_DIR/prompt.zsh"   # Configuración del tema/prompt
# Cargar Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Cargar personalizaciones adicionales después de Oh My Zsh para evitar sobrescrituras
source "$ZSH_CONFIG_DIR/aliases.zsh"  # Alias personalizados
source "$ZSH_CONFIG_DIR/functions.zsh" # Funciones personalizadas

# ─────────────────────────────────────────────
# 🚀 Configuración post-carga (opcional)
# ─────────────────────────────────────────────

# Alias para recargar la configuración
alias reload!='source ~/.zshrc'

# Mensaje opcional

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
