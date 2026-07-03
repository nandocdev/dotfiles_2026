# ==================================================================== #
#  Zsh Configuration - functions.zsh                                   #
#  Funciones personalizadas para automatizaciones y utilidades.        #
# ==================================================================== #

# Crear y entrar a un directorio
mkcd() {
    if [[ -z "$1" ]]; then
        echo "Uso: mkcd <nombre_directorio>"
        return 1
    fi
    mkdir -p "$1" && cd "$1"
}

# Crear una estructura de directorios para pruebas de seguridad (tu función mkt)
mkt() {
    mkdir -p {nmap,content,exploits,scripts,creds,loot,report,scans}
    echo "Creados: nmap, content, exploits, scripts, creds, loot, report, scans"
}

# Extraer información de nmap (tu función existente, mejorada)
# - Mensaje de uso añadido
# - Ámbito de variables mejorado (local)
# - Verificación de xclip/wl-copy para soporte de portapapeles
# - Eliminación de la creación de archivos temporales
extractPorts() {
    if [[ -z "$1" ]]; then
        echo "Uso: extractPorts <archivo_nmap>"
        return 1
    fi

    local ports
    ports="$(grep -oP '\d{1,5}/open' "$1" | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    local ip_address
    ip_address="$(grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' "$1" | sort -u | head -n 1)"

    echo -e "\n[*] Extrayendo información...\n"
    echo -e "\t[*] Dirección IP: $ip_address"
    echo -e "\t[*] Puertos abiertos: $ports\n"

    # Verificar xclip (X11) o wl-copy (Wayland) para soporte de portapapeles
    if command -v xclip &> /dev/null; then
        echo "$ports" | tr -d '\n' | xclip -sel clip
        echo -e "[*] Puertos copiados al portapapeles (xclip)\n"
    elif command -v wl-copy &> /dev/null; then
        echo "$ports" | tr -d '\n' | wl-copy
        echo -e "[*] Puertos copiados al portapapeles (wl-copy)\n"
    else
        echo -e "[!] No se encontraron xclip ni wl-copy. No se puede copiar al portapapeles.\n"
    fi
}

# Establecer colores para 'man' (tu función existente, ligeramente optimizada para claridad)
# Usa 'command man' para prevenir llamadas recursivas a esta función.
man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@" # Usar 'command man' para prevenir llamadas recursivas
}

# Mejora de fzf (Refactorizada para máxima velocidad y estética)
fzf-lovely() {
    local preview_cmd='bat --style=numbers --color=always --line-range :500 {}'
    fzf -m --preview "$preview_cmd"
}
# Alias para acceso fácil:
alias ff='fzf-lovely' # Búsqueda difusa de archivos con previsualización

# Buscador de procesos interactivo (Kill con estilo)
function fps() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m --ansi --header='[CTRL-M: Kill Process]' --preview 'echo {}' --preview-window down:3:wrap | awk '{print $2}')
  if [ -n "$pid" ]; then
    echo "Matando proceso $pid..."
    echo $pid | xargs kill -9
  fi
}

# Selector de ramas Git interactivo
function fgb() {
  local branches branch
  branches=$(git branch --all | grep -v 'HEAD') &&
  branch=$(echo "$branches" | fzf --height 40% --layout=reverse --border --ansi --header='[Git Checkout Branch]' | sed "s/.* //" | sed "s#remotes/[^/]*/##") &&
  if [ -n "$branch" ]; then
    git checkout "$branch"
  fi
}

# Eliminación segura de archivos (tu función existente)
# Mensaje de uso y confirmación añadidos.
rmk() {
    if [[ -z "$1" ]]; then
        echo "Uso: rmk <archivo_a_destruir>"
        return 1
    fi
    echo "Destruyendo y limpiando '$1' de forma segura..."
    scrub -p dod "$1" # Estándar DoD 5220.22-M (7 pasadas)
    shred -zun 10 -v "$1" # Sobrescribe 10 veces con datos aleatorios, luego cero y desenlaza
    echo "'$1' eliminado de forma segura."
}

# Git: Stage all, commit con mensaje, y push
gcap() {
    if [[ -z "$1" ]]; then
        echo "Uso: gcap \"<mensaje_commit>\""
        return 1
    fi
    git add .
    git commit -m "$1"
    git push
}

# Crear un directorio temporal y cambiar a él
mktempd() {
    local tmp_dir
    tmp_dir=$(mktemp -d)
    echo "Directorio temporal creado y entrado: $tmp_dir"
    cd "$tmp_dir" || return
}

# Servidor HTTP simple (Python)
serve_http() {
    local port="${1:-8000}" # Puerto por defecto 8000
    echo "Iniciando servidor HTTP de Python en el puerto $port en el directorio actual..."
    python3 -m http.server "$port"
}

# Codificar/Decodificar Base64
b64e() {
    if [[ -z "$1" ]]; then
        echo "Uso: b64e <cadena_a_codificar>"
        return 1
    fi
    echo -n "$1" | base64
}

b64d() {
    if [[ -z "$1" ]]; then
        echo "Uso: b64d <cadena_a_decodificar>"
        return 1
    fi
    echo "$1" | base64 -d
}

# Generar una contraseña fuerte
genpass() {
        local length="${1:-16}" # Longitud por defecto 16
        tr -dc A-Za-z0-9_@#$%^&*()_+=- | head -c "$length" /dev/urandom; echo
}

# Buscar archivos por nombre
findfile() {
    if [[ -z "$1" ]]; then
        echo "Uso: findfile <nombre_archivo>"
        return 1
    fi
    find . -iname "*$1*"
}

# Extraer archivos comprimidos automáticamente
extract() {
    if [[ -z "$1" ]]; then
        echo "Uso: extract <archivo_comprimido>"
        return 1
    fi
    case "$1" in
        *.tar.bz2)   tar xjf "$1"   ;;
        *.tar.gz)    tar xzf "$1"   ;;
        *.bz2)       bunzip2 "$1"   ;;
        *.rar)       unrar x "$1"   ;;
        *.gz)        gunzip "$1"    ;;
        *.tar)       tar xf "$1"    ;;
        *.tbz2)      tar xjf "$1"   ;;
        *.tgz)       tar xzf "$1"   ;;
        *.zip)       unzip "$1"     ;;
        *.Z)         uncompress "$1";;
        *.7z)        7z x "$1"      ;;
        *)           echo "No puedo extraer '$1'" ;;
    esac
}

# Mostrar uso de disco ordenado
dusort() {
    du -h --max-depth=1 | sort -hr
}

# Buscar texto en archivos recursivamente
searchtext() {
    if [[ -z "$1" ]]; then
        echo "Uso: searchtext <texto>"
        return 1
    fi
    grep -rnw . -e "$1"
}


clean(){
    echo "🧹 Iniciando limpieza del sistema Arch Linux..."
    echo ""
    echo "⚠️  Esta función realizará operaciones que requieren sudo."
    echo "📋 Operaciones que se realizarán:"
    echo "   1. Limpiar caché de RAM"
    echo "   2. Limpiar caché de pacman"
    echo "   3. Limpiar caché de AUR (yay/paru)"
    echo "   4. Limpiar caché de usuario"
    echo "   5. Limpiar thumbnails"
    echo "   6. Eliminar paquetes huérfanos"
    echo "   7. Limpiar historial de yay"
    echo ""
    read -q "REPLY?¿Continuar? (y/N): " && echo "" || { echo ""; echo "❌ Operación cancelada."; return 1; }

    # Limpiar caché de RAM
    echo "🧠 Limpiando caché de RAM..."
    sudo sync && sudo sysctl vm.drop_caches=3

    # Limpiar caché de pacman (paquetes oficiales)
    echo "📦 Limpiando caché de pacman..."
    sudo pacman -Scc --noconfirm

    # Limpiar caché de AUR (yay/paru)
    echo "📦 Limpiando caché de AUR..."
    if command -v yay &> /dev/null; then
        yay -Scc --noconfirm
    elif command -v paru &> /dev/null; then
        paru -Scc --noconfirm
    fi

    # Limpiar caché de usuario
    echo "👤 Limpiando caché de usuario..."
    rm -rf ~/.cache/*

    # Limpiar thumbnails
    echo "🖼️ Limpiando thumbnails..."
    rm -rf ~/.cache/thumbnails/*

    # Limpiar paquetes huérfanos (dependencies no necesarias)
    echo "🗑️ Eliminando paquetes huérfanos..."
    local orphans
    orphans=$(pacman -Qdtq 2>/dev/null)
    if [ -n "$orphans" ]; then
        echo "   Paquetes huérfanos encontrados. ¿Eliminarlos? (y/N)"
        read -q "REPLY" && echo "" || { echo ""; echo "   Saltando eliminación de paquetes huérfanos."; }
        if [ "$REPLY" = "y" ] || [ "$REPLY" = "Y" ]; then
            sudo pacman -Rns $orphans --noconfirm 2>/dev/null
        fi
    else
        echo "   No se encontraron paquetes huérfanos."
    fi

    # Limpiar historial de yay
    echo "📝 Limpiando historial de yay..."
    if command -v yay &> /dev/null; then
        yay -Y --clean
    fi

    echo ""
    echo "✅ ¡Limpieza completada!"
    echo "💾 Espacio libre:"
    df -h / | awk 'NR==2 {print "   " $4}'
}

# --- Laravel Helpers ---

# Ver logs de Laravel en tiempo real filtrando errores
function logw() {
    local log_file="storage/logs/laravel.log"
    if [ -f "$log_file" ]; then
        tail -f "$log_file" | grep -iE "error|exception|critical|alert" --color=always
    else
        echo "Error: No se encontró el archivo de log en $log_file"
    fi
}

# Ejecutar tests (Pest) con filtro
function pt() {
    if [ -f "./vendor/bin/pest" ]; then
        ./vendor/bin/pest --filter "$1"
    else
        echo "Error: No se encontró el binario de Pest en ./vendor/bin/pest"
    fi
}

# --- Docker Helpers ---

# Acceso rápido a shell de un contenedor
function dsh() {
    if [ -z "$1" ]; then
        echo "Uso: dsh <nombre_contenedor>"
        return 1
    fi
    docker exec -it "$1" /bin/sh || docker exec -it "$1" /bin/bash
}

#    # Si no están instalados automáticamente:
#    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting