---
title: "Jekyll: Sitios web estáticos amigables"
last_modified_at: 2024-05-29T20:20:02-03:00
categories:
  - Blog
tags:
  - principiantes
  - tutoriales
  - 
---


## Un poco de historia

Nunca supe mucho de Frontend. Se que tienen muchos frameworks que terminan generando pilas de archivos html al fin y al cabo. Nunca tuve intenciones ni de cerca de aprender como funcionan porque no me llama el diseño web así que activamente me mantuve alejado del rubro. 

Eso fue hasta que, recomendado en Youtube por Techno Tim, gran creador de contenido, me enteré que existía [Jekyll](https://jekyllrb.com/), un generador de sitios estáticos y blogs que solo requería contenido en formato Markdown para la generación de esos aburridos HTML's!


## Y esto como funciona?

Jekyll es un framework escrito en ruby que se encarga de convertir las configuraciones (.yml) y archivos markdown (.md) en todos los archivos necesarios para una web estática!


## Y esto como se instala?

Primero, tenemos que instalar Ruby en el sistema. Las instrucciones cambian de acuerdo al sistema operativo.

### Ubuntu

Instalar ruby y los otros requisitos. 

```sh
sudo apt-get install ruby-full build-essential zlib1g-dev
```
**Que instalo???:** los paquetes son el del lenguaje de programación ruby, el build-essential que tiene todos los programas para compilar y procesar código entre otros y zlib1g de compresión de la rama de desarrollo, de ahi el -dev. 
{: .notice--info}

Después se recomienda configurar unas variables de entorno del sistema operativo para que no se instalen los paquetes de Ruby (que se llaman *gems*).

```sh
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
**Que ejecuto???:** El comando **echo** genera como salida los strings que se le pasan como argumento, a esos strings generados se los direcciona y adjunta (con **>>**) al final de archivo llamado *.bashrc* ubicado en la carpeta home *~* del usuario que ejecuta el comando. El efecto es el mismo que abrir el archivo .bashrc con un editor de texto y ponerle las 3 lineas al final entre las comillas. Finalmente el **source** se encarga de cargar esas nuevas variables de entorno al contexto del sistema. 
{: .notice--info}

Finalmente instalamos los paquetes jekyll y bundler de Ruby


```sh
gem install jekyll bundler
```

## Y esto como se usa?

### Primer ejemplo

Para crear un nuevo sitio dentro del directorio donde nos encontremos:

```sh
jekyll new blogcito-0km
```

Esto va a crear una carpeta con un primer proyecto de ejemplo. Podemos entrar al directorio y abrirlo con VSCode

```sh
cd blogcito-0km
code .
```

Ahi vamos a poder ver todos los archivos generados. 

Para lanzar nuestro proyecto de ejemplo y verlo en el navegador ejecutamos:

```sh
bundle exec jekyll serve
```

Y si todo sale bien, deberiamos ver nuestro nuevo blogcito en [http://localhost:4000/](http://localhost:4000/).


Fuentes:

- [Jekyll](https://learn.microsoft.com/es-es/windows/wsl/)
- [Minimal mistakes theme](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux)
