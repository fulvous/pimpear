#!/bin/bash

#Pimpear es un set de scripts para el taller impartido en el FSL Vallarta 2019
#Copyright (C) 2019 Leon Ramos @fulvous
#
#Este archivo es parte de Pimpear
#
#Pimpear es software libre: Puede redistribuirlo y/o 
#modificarlo bajo los terminos de la Licencia de uso publico 
#general GNU de la Fundacion de software libre, ya sea la
#version 3 o superior de la licencia.
#
#Pimpear es distribuida con la esperanza de que sera util,
#pero sin ningun tipo de garantia; inclusive sin la garantia
#implicita de comercializacion o para un uso particular.
#Vea la licencia de uso publico general GNU para mas detalles.
#
#Deberia de recibir uan copia de la licencia de uso publico
#general junto con Pimpear, de lo contrario, vea
#<http://www.gnu.org/licenses/>.
#
#This file is part of Pimpear
#
#Pimpear is free software: you can redistribute it and/or 
#modify it under the terms of the GNU General Public License 
#as published by the Free Software Foundation, either version 3 
#of the License, or any later version.
#
#Pimpear is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with Pimpear  If not, see 
#<http://www.gnu.org/licenses/>.

function debug {
  [ "${VERBOSE}" == "1" ] && echo "${NEGRITAS}${CYAN}${*}${RESET}"
}

function echon {
  #funcion echo sin salto de carro
  echo "${*}" | tr -d '\n'
}

function informa {
  NUMBER=1
  for ARG in "$@" ; do
    case $NUMBER in
      1)
        echon ${NEGRITA}${ARG}": "
      ;;
      2)
        echon ${AMARILLO}${ARG}" "
      ;;
      3)
        echon "${BLANCO}-- ${CYAN}${ARG} "
      ;;
      *)
        echon ${ARG}" "
      ;;
    esac
    NUMBER=$(( NUMBER + 1 ))
  done
  echo "${BLANCO}--${RESET}"
}

function res_ok {
  echon "${BLANCO}[ ${VERDE}${3} "
  echon "${BLANCO}] "
  echon "${NEGRITA}${1}: "
  echo "${AMARILLO}${2}${RESET}"
}

function res_err {
  echon "${BLANCO}[ ${ROJO}${3} "
  echon "${BLANCO}] "
  echon "${NEGRITA}${1}: "
  echo "${AMARILLO}${2}${RESET}"
}

function division {
  #Linea divisoria
  echo
  COLS=$( tput cols )
  echon ${AMARILLO}
  for i in $( seq 1 $COLS ) ; do
    echon "-"
  done 
  echo ${RESET}
  echo
}

function jumbotron {
  division
  echo "  ${NEGRITAS}${AMARILLO}${1}${RESET}" | fmt -
  echo
  shift
  for ARG in "$@" ; do
    echo "  ${ARG}" | fmt -
    echo 
  done
  division
}
