---
layout: single
title: "Instalacion de Sistema Operativo poco ortodoxa: debootstrap + chroot"
last_modified_at: 2024-05-29T20:20:02-03:00
categories:
  - Avanzado
tags:
  - Tutoriales Herramientas
  - Linux OS
  - Fedora
  - Ubuntu
toc: true
toc_sticky: false
--- 

Bueno, resulta que me encontraba en mi tradicion bienal_o_trienal_dependiendo_de_que_tanto_tiempo_disponga_de_vacaciones de actualizar todos los sistemas, meter unos buenos backups e instalar nuevos y frescos sistemas operativos LTS, asi como también pegarle una buena ajusticiada en forma de formateada al disco con windows. Todo esto despues de unos pequeños upgrades que pude meterle a la estación de trabajo, entre ellos un nuevo disco ssd nvme que se suma a los 2 sólidos previamente presentes en la máquina. 

Resulta que entonces, el objetivo inicial fue decidir que sistemas operativos iban a quedar y cuales se iban. Siendo un ávido practicante del arte del distrohopping, como usuario y hobbysta, me dispuse a abrir el mercado de pases para definir que distribuciones se iban a quedar y cuales se iban a ir. 

Entonces se abre el mercado de pases con las siguientes operaciones:

- Baja de contrato: Fedora - No fue renovado para actualización. Se le agradece mucho sus años en el de servicio, logró ser el sistema operativo de preferencia tanto en la compu de escritorio como la notebook. Sigue siendo una distro noble pero es momento de probar otras cosas. Aguante Flatpak y.. emm no mucho mas que eso porque algunas configs o librerias de programas que traia de otro lado me rompian las bolas de vez en cuando.. Pero no mas que otras. Aunque si renegue con algunas, recuerdo la virtualización que tuve que configurar el secure boot para virtual box, algunos drivers de cuda, y creo recordar algun problema con drivers + docker + gpu acceleration.. Cosas super puntuales y específicas. En fin, baja honorífica en general. Siempre tendrá un lugar en mi corazón, y quien sabe, en el futuro puede que vuelva a ser reincorporado.

- Nueva incorporación: Ubuntu24:04 - Pensando en que es la distribucion mas adoptada, en este caso vuelve a la rotación con el objetivo de tenerla como la primaria 
  - Para grabacion de tutos, todo software mas actualizado en general corre bien sobre ubuntu.
  - Por su correspondencia directa con el windows subsystem for linux, la idea es que todo tutorial que grabe aca funcione ahi también.
  - Porque es el mas amigable para principiantes y gente que venga desde windows. 
- Nueva incorporación al plantel: NixOS. Pensado para modularizar estaciones de trabajo facilmente reproducibles y migrables con configuraciones y todo.
  - 