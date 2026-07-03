# ─────────────────────────────────────────────
# 🧠 Configuración principal de ZSH
# ─────────────────────────────────────────────

# Importar configuración modular desde zshrc.zsh si existe
if [ -f "$HOME/.config/zsh/zshrc.zsh" ]; then
	source "$HOME/.config/zsh/zshrc.zsh"
fi




# Added by Antigravity CLI installer
export PATH="/home/ferncastillo/.local/bin:$PATH"

# opencode
export PATH=/home/ferncastillo/.opencode/bin:$PATH
