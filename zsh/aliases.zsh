# ==================================================================== #
#  Zsh Configuration - aliases.zsh                                     #
#  Alias personalizados para comandos comunes y automatizaciones.     #
# ==================================================================== #

# Alias Generales
# lsd con iconos habilitados (requiere fuente Nerd Font)
alias ls='lsd --icon=always'
alias ll='lsd -lh --icon=always --group-dirs=first'
alias la='lsd -a --icon=always --group-dirs=first'
alias l='lsd --icon=always --group-dirs=first'
alias lla='lsd -lha --icon=always --group-dirs=first'
alias cat='bat --style=numbers --color=always' # Usa bat para cat con números de línea y resaltado de sintaxis
alias e='ranger' # Tu gestor de archivos
alias reload='source ~/.zshrc' # Recarga rápida de zshrc
alias cls='clear' # Alias para limpiar la pantalla
alias c='clear' # Alias más corto para limpiar



# Alias de Sistema (Arch Linux - yay)
alias update="sudo npm install -g @google/gemini-cli && yay -Syyu" # Actualizar sistema y paquetes de AUR
alias install="yay -S "  # Instalar paquetes
alias remove="yay -R"    # Eliminar paquetes
alias search="yay -Ss"   # Buscar paquetes
alias psg="ps aux | grep -v grep | grep -i" # Grep de procesos
alias myip="curl ipinfo.io/ip" # Obtener IP pública
alias hosts="cat /etc/hosts" # Editar archivo hosts rápidamente
alias ports="sudo netstat -tulpn | grep LISTEN" # Listar puertos abiertos
alias duf="du -sh *" # Uso de disco del contenido del directorio actual
alias dfh="df -h" # Espacio en disco legible

# Alias de Git (si no usas el plugin git de Oh My Zsh, o para alias personalizados)
alias gs='git status -sb'
alias ga='git add .'
alias gc='git commit -m'
alias gca='git commit -am' # Commit todos los cambios y añadir sin seguimiento
alias gp='git push'
alias gpo='git push origin' # Push a origin
alias gpom='git push origin main' # Push a origin main
alias gd='git diff'
alias glo='git log --oneline --decorate --all --graph' # Log de Git más bonito
alias gco='git checkout' # Checkout de rama/commit
alias gb='git branch' # Listar ramas
alias gbr='git branch -r' # Listar ramas remotas
alias gba='git branch -a' # Listar todas las ramas

# Alias Específicos de Desarrollo
# Alias Específicos de Desarrollo
alias laravel='~/.config/composer/vendor/bin/laravel'
alias art='php artisan'
alias comp='composer'
alias mfs='php artisan migrate:fresh --seed' # Migración limpia con seeders
alias tinker='php artisan tinker'
alias optimize='php artisan optimize'
alias pint='./vendor/bin/pint' # Laravel Pint para formateo
alias stan='./vendor/bin/phpstan analyse' # Larastan/PHPStan para análisis estático
alias serve='php artisan serve' # Servidor de desarrollo de Laravel
alias dev='code .'
alias n='npm'
alias y='yarn'
alias d='docker'
alias dc='docker-compose'

# Alias de Red/VPN
alias vpn='sudo openfortivpn &' # Tu alias existente
alias vpnd="killall openfortivpn" # Para terminar la VPN fácilmente

# Dotfiles (asumiendo que gestionas tus dotfiles con un repo git bare)
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias dotadd="dotfiles add"
alias dotcommit="dotfiles commit -m"
alias dotpush="dotfiles push"
alias dotstatus="dotfiles status"
