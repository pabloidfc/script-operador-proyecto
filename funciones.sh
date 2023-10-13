#!/bin/bash

# Función que se encarga de mostrar el Uso de los recursos del ordenador
mostrar_uso_recursos() {
    cpu_usage=$(top -b -n 1 -d 2 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')
    total_memory=$(free -m | awk '/Mem:/ {print $2}')
    used_memory=$(free -m | awk '/Mem:/ {print $3}')
    free_memory=$(free -m | awk '/Mem:/ {print $4}')

    echo "Uso de CPU: ${cpu_usage}%"
    echo "Memoria Total: ${total_memory}MB"
    echo "Memoria Usada: ${used_memory}MB"
    echo "Memoria Libre: ${free_memory}MB"
}

# Función que se encarga de mostrar los contenedores
mostrar_contenedores() {
  docker ps
}

# Función encargada de mostrar el menu de selección
mostrar_menu() {
  echo "Selecciona una opción:"
  select opcion in "${opciones[@]}"; do
    case $REPLY in
      1)
        echo "Has seleccionado: $opcion"
        mostrar_uso_recursos
        ;;
      2)
        echo "Has seleccionado: $opcion"
        mostrar_contenedores
        ;;
      3)
        echo "Cerrando script."
        exit 0
        ;;
      *)
        echo "Opción no válida. Por favor, selecciona un número válido."
        ;;
    esac
  done
}