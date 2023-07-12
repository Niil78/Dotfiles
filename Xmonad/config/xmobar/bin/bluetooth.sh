#!/bin/bash

# Función para obtener el estado del Bluetooth
get_bluetooth_status() {
    status=$(bluetoothctl show | awk '/Powered/ {print $2}')
    echo "$status"
}

# Función para mostrar el módulo de Bluetooth en xmobar
bluetooth_module() {
    status=$(get_bluetooth_status)
    if [[ $status == "yes" ]]; then
        echo "<fc=green> 󰂰 </fc>"
    else
        echo "<fc=red> 󰂯 </fc>"
    fi
}

bluetooth_module
