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

Jekyll es un generador de sitios web estáticos escrito en ruby que se encarga de convertir las configuraciones (.yml) y archivos markdown (.md) en todos los archivos necesarios para una web estática! Los archivos que nosotros editamos son texto plano, nada de andar renegando con sofisticados frameworks de frontend. Esta pensado para ser simple, flexible y es fácilmente integrable con Github Pages por lo que se lo suele usar tanto para blogs personales como para documentaciones de proyectos.

**Sitios estáticos:** a diferencia de los sitios dinámicos, el usuario no puede interactuar con el contenido del sitio. O sea, llenar datos, formularios, hacer un login, etc. Al no generar contenido en tiempo real desde una base de datos, son mas rápidos, seguros y fáciles de desplegar.
{: .notice--info}

### Markdown

Markdown es un lenguaje que da formato básico a texto plano. Esta pensado para ser facil de escribir, leer y simple.

### Plantillas Liquid

Liquid es un lenguaje de plantillas creado por Shopify. Jekyll usa Liquid para procesar y renderizar plantillas para las páginas. Te permite usar marcadores de posición y lógica en tus plantillas, haciendo tu sitio dinámico sin necesitar un servidor backend. Las plantillas pueden tener distintos estilos de post, distintas disposiciones de componentes. En general esta herramienta es util cuando se quiere hacer modificaciones más profunda sobre el tema original. 


### Funcionamiento

Los elementos claves de este generador de sitios estáticos son:

1. **Archivos fuente:** Estos son los archivos Markdown, HTML y otros componentes que quieras agregar al sitio (imágenes, CSS o JavaScript).
2. **Archivos de configuración:** El principal es el `_config.yml` que contiene todas las configuraciones del sitio.
3. **Templates:** Layouts e Includes (que serian estructuras de páginas y librerías) que se escriben en Liquid típicamente. En un principio no hace falta ni crear estos archivos ya que vienen con el tema, y en general cuando se generan estos archivos sobrescriben los que vienen por defecto del tema. Solo para personalizaciones mas avanzadas del sitio.
4. **Generador de sitios estáticos:** Es el rol del programa, Jekyll en sí, escrito en ruby, procesa todos los archivos anteriormente mencionados para generar el sitio estático.
5. **Salida:** Los archivos generados del sitio estático generalmente se ubican en el directorio `_site/`.

![Asi funciona](/assets/images/posts/2024-05-29-jekyll-site-generation-process.png)

### Estructura de Directorios

A continuación, la lista de archivos y carpetas que en conjunto hacen la estructura de un sitio de Jekyll:

- `_config.yml`: Archivo de configuración.
- `_posts/`: Tus publicaciones de blog escritas en formato Markdown.
- `_layouts/`: Plantillas de diseño que definen la estructura de tu sitio.
- `_includes/`: Componentes reutilizables como encabezados o pies de página.
- `_site/`: La salida compilada de tu sitio.
- `index.md` o `index.html`: La página principal de tu sitio.


### Beneficios

- **Simplicidad**: No se requieren bases de datos ni código del lado del servidor.
- **Rendimiento**: Tiempos de carga rápidos ya que todo está pre-renderizado.
- **Seguridad**: Superficie de ataque reducida en comparación con sitios dinámicos.
- **Flexibilidad**: Altamente personalizable a través de temas y plugins.
- **Integración con GitHub Pages**: Alojamiento gratuito y fácil.

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

Finalmente instalamos los paquetes jekyll y bundler de Ruby para nuestro usuario:

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

Esta linea lo que hace es construir el sitio estático a partir de los archivos, y levantar un servidor web local en el cual podemos visualizar el resultado del sitio generado.

**Apagando el sitio:** En la terminal que tenemos corriendo el servidor, podemos apretar Ctrl+C para que el proceso se detenga y ahi dejaremos de ver el blogcito en nuestra página. 
{: .notice--info}

### Segundo ejemplo: Minimal mistakes

Ahora vamos a bajar un projecto de internet para configurarlo a nuestro gusto, pero usando un ***Tema***. Los temas vienen con caracteristicas extra y formatos de página preconfigurables para personalizar a gusto. En nuestro caso vamos a usar Minimal Mistakes.

**¿Porque este tema?** Minimal Mistakes es un tema de Jekyll altamente personalizable y responsivo (esto es se adapta a distintos tamaños de pantalla), ademas de tener características ya implícitas en el tema. Es una excelente opción para principiantes debido a su proceso de configuración bien documentado, su hermoso diseño y su versatilidad, permitiendo crear un sitio que se ve profesional sin mucho esfuerzo.
{: .notice--info}

Entonces, arrancamos con un proyecto nuevo. En un principio, hay 3 métodos de crear un nuevo sitio con este tema, acá vamos a usar el el [método del paquete gem](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/#gem-based-method) del tema a modo de ejemplo. Salimos de la carpeta actual y creamos un nuevo sitio.

```sh
cd ..
jekyll new minimal-test
code .
```
Ahi debemos ver en nuestro editor, el visual studio code, los contenidos del proyecto. Allí podremos modificar entonces el archivo  `Gemfile` añadiendo una linea que indica instalar la gema del tema en el proyecto.

```ruby
gem "minimal-mistakes-jekyll"
```

Ahora podemos entonces ejecutar `bundle install` para instalar el tema.

#### Configuración

Lo primero que debemos hacer es editar el `_config.yml`. Este archivo contiene variables que definen como y con que contenido se genera el sitio. Activa funcionalidades, define temas, navegación y mucho mas. Podemos ver un ejemplo de todo lo que se puede configurar para este tema en el el [default _config.yml](https://github.com/mmistakes/minimal-mistakes/blob/master/_config.yml) en el repositorio del tema. 

De minima debemos hacer primero estas modificaciones:

```yaml
theme: minimal-mistakes-jekyll

# Configuración del sitio
title: Mi Blog
description: Un blog sobre ...
author: Tu Nombre
email: tu-email@ejemplo.com

# Configuración de construcción
markdown: kramdown
highlighter: rouge
```
Luego para que funcione debemos:

1. Reemplazar el index.md con un archivo index.html que contenga el siguiente contenido:

```
---
layout: home
author_profile: true
---
```

2. Cambiar **layout: post** dentro del post ejemplo _posts/0000-00-00-welcome-to-jekyll.markdown a **layout: single**.

El layout es el que nos define el estilo de esa página en particular, ya sea un post u otra de las páginas de navegación y auxiliares, como categorías y tags.
{: .notice--info}


3. Borrar _about.md_ o como mínimo cambiar las referencias que digan **layout: page** a **layout: single**

Finalmente ejecutar:

```sh
bundle exec jekyll serve --livereload
```

Para ver nuestros cambios. Cuando le pasamos al programa el argumento _--livereload_ el programa va a revisar los archivos y actualizar cualquier cambio a los archivos del sitio para volver a generarlo y que se actualize automaticamente en el navegador que estamos viendo nuestros cambios.

Una vez hecho esto, podemos crear nuevas páginas para probar los distintos layouts y formatos que se pueden generar con este tema de Jekyll. Solo tenemos que tener cuidado de respetar el formato del nombre de los archivos markdown para las páginas tipo post **AAAA-MM-DD-nombre-de-post.md** y de respetar el formato del encabezado de los posts, donde se configura el estilo. Se llama [Front Matter](https://jekyllrb.com/docs/front-matter/) y es un bloque que esta arriba del archivo markdown, que indica el estilo de página entre otras cosas. No hace falta configurar todas las variables, pero si brindan más posibilidad de personalizar post por post.

## Comentarios de cierre

En este tutorial básico aprendiste como funcionan los generadores de sitios estáticos en general, y en particular Jekyll. Pudiste crear un sitio básico y uno usando un tema.

Hay mucho mas por aprender en cuanto a configuración del sitio y principalmente personalización usando las herramientas del tema. ¡También hasta se puede personalizar sobre la personalización ya presente en el tema! 

Pero por el momento, con lo que hay hasta acá ya debieras poder usarlo, explorar las funcionalidades y personalizaciones disponibles en este tema. Y si esto no alcanza o el tema no te convence, hay [miles para elegir](https://jekyllrb.com/docs/themes/#pick-up-a-theme), salí a buscar uno que te guste!

Fuentes:

- [Jekyll](https://learn.microsoft.com/es-es/windows/wsl/)
- [Minimal mistakes theme](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux)
