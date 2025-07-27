#!/bin/bash

# Directorio donde están tus wallpapers
WALLPAPER_DIR="$HOME/Wallpapers"

# Asegurarse de que el directorio existe
if [ ! -d "$WALLPAPER_DIR" ]; then
  notify-send "Error" "El directorio $WALLPAPER_DIR no existe."
  exit 1
fi

# Obtener la lista de wallpapers (formatos comunes de imagen)
WALLPAPERS=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \))

# Mostrar el menú con Rofi
SELECTED=$(echo "$WALLPAPERS" | rofi -dmenu -p "Seleccionar wallpaper:")

# Si no se selecciona nada, salir
if [ -z "$SELECTED" ]; then
  notify-send "No se seleccionó ningún wallpaper."
  exit 0
fi

# Aplicar el wallpaper con swww (puedes cambiarlo por hyprpaper si lo prefieres)
swww img "$SELECTED" --transition-type wipe --transition-duration 2

# Generar esquema de colores con Pywal
wal -i "$SELECTED"

# Opcional: Recargar configuraciones de aplicaciones (por ejemplo, Hyprland)
# Esto puede variar según tu configuración
hyprctl reload

# Notificación de éxito
notify-send "Wallpaper cambiado" "Esquema de colores actualizado con Pywal."
