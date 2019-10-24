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

echo "${AMARILLO}Este texto es amarillo${RESET} este ya no."

debug "este es un debug que NO aparecera"

VERBOSE=1

debug "este es un debug que SI aparece"

res_ok "El proceso Chanito" "hizo todo bien" "OK"

res_err "El proceso Sutano" "falla al ejecutarse" "ERROR"

informa "Comenzando con el proceso" "canijo" "para conquistar el mundo" 

jumbotron "Este es un anuncio grande ideal para menu o para informacion de uso" \
  "Soporta ir poniendo varias lineas" \
  "Una despues de la otra en el mismo comando" \
  "1) algo" \
  "2) otra" \
  "3) esta"

