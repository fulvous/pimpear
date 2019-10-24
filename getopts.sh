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

WD=$( cd "$(dirname "$0")" && pwd )

. ${WD}/include/colores.sh
. ${WD}/include/formato.sh

VERBOSE=0

debug "Este es un comentario que NO se debe ser"

function uso {
  SCRIPT=$( basename "$0" )
  jumbotron "Uso: ${SCRIPT} -o [ -f archivo | -v ] " \
    " -o           Obligatoria" \
    " -f archivo   Recibe nombre de archivo" \
    " -v           Activa del debug (verbose)"
  exit 1
}

while getopts "of:v" OPTS ; do
  case "${OPTS}" in
    "o") OBLIGATORIA=1
      ;;
    "f") ARCHIVO="${OPTARG}"
      ;;
    "v") VERBOSE=1
      ;;
    "?") uso
      ;;
  esac
done
shift $(($OPTIND -1))

debug "Este comentario SI puede aparecer con -v"

if [ -z ${OBLIGATORIA} ] ; then
  debug "No puso la opcion -o que es obligatoria"
  uso
fi

debug "Revisar nombre de archivo"
if [ -z "${ARCHIVO}" ] ; then
  debug "No puso nombre de archivo"
else
  debug "Validar alfanumerico, _ -  y espacios en nombre de archivo"
  ARCHIVO2=$( echo "${ARCHIVO}" | sed -e 's/[^[:alnum:]_\.\ \-]//g' )
  if [ "${ARCHIVO}" != "${ARCHIVO2}" ] ; then
    res_err "El nombre de archivo no valido" "${ARCHIVO}" "ERROR"
  else
    informa "El nombre de archivo recibido es" "${ARCHIVO}"
  fi
fi


