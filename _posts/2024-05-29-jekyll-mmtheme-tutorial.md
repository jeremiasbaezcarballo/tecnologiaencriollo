---
title: "Jekyll: Sitios web estáticos amigables"
last_modified_at: 2024-05-29T20:20:02-03:00
categories:
  - General
tags:
  - Tutoriales Herramientas
  - principiantes
  - tutoriales
  - 
---

## Un poco de historia

Nunca supe mucho de Frontend. Se que tienen muchos frameworks que terminan generando pilas de archivos html al fin y al cabo. Nunca tuve intenciones ni de cerca de aprender cómo funcionan porque no me llama el diseño web así que activamente me mantuve alejado del rubro. 

Eso fue hasta que, recomendado en Youtube por Techno Tim, gran creador de contenido, me enteré que existía [Jekyll](https://jekyllrb.com/), un generador de sitios web estáticos y blogs que solo requería contenido en formato Markdown para la generación de esos aburridos HTML's!

## Y esto, ¿cómo funciona?

Jekyll es un generador de sitios web estáticos escrito en ruby que se encarga de convertir las configuraciones (.yml) y archivos markdown (.md) en todos los documentos necesarios para una web estática. Los archivos que nosotros editamos son texto plano, nada de andar renegando con sofisticados frameworks de frontend. Está pensado para ser simple, flexible y es fácilmente integrable con Github Pages por lo que se lo suele usar tanto para blogs personales como para documentaciones de proyectos.

**Sitios estáticos:** a diferencia de los sitios dinámicos, el usuario no puede interactuar con el contenido del sitio. O sea, llenar datos, formularios, hacer un login, etc. Al no generar contenido en tiempo real desde una base de datos, son mas rápidos, seguros y fáciles de desplegar.
{: .notice--info}

### Markdown

Markdown es un lenguaje que da formato básico a texto plano. Esta pensado para ser facil de escribir, leer y sin complicaciones. Te permite crear títulos, listas, links, imágenes, citas y más, con una sintaxtis bien simple.
Se usa mucho para documentar proyectos, escribir posts en blogs, mandar mails y en Github. Es compatible con un montón de herramientas, y como no necesitás editores rebuscados, es ideal para cuando querés algo rápido y efectivo.

### Plantillas Liquid

Liquid es un lenguaje de plantillas creado por Shopify que Jekyll usa para procesar y renderizar las páginas de tu sitio. Te permite usar marcadores de posición y lógica en tus plantillas, haciendo tu sitio dinámico sin tener que depender de un servidor backend. Las plantillas pueden tener diferentes estilos de post y distintas disposiciones de componentes, lo que te da más flexibilidad para personalizar tu sitio a gusto. En general, esta herramienta es útil cuando se quiere hacer modificaciones más profundas sobre el tema original. 

### Funcionamiento

Los elementos claves de este generador de sitios estáticos son:

1. **Archivos fuente:** Estos son los archivos Markdown, HTML y otros componentes que quieras agregar al sitio (imágenes, CSS o JavaScript).
2. **Archivos de configuración:** El principal es el `_config.yml` que contiene todas las configuraciones del sitio.
3. **Templates:** Layouts e Includes (que serian estructuras de páginas y librerías) que se escriben en Liquid típicamente. En un principio no hace falta crear estos archivos ya que vienen con el tema, y en general, cuando se generan estos archivos sobrescriben los que vienen por defecto del tema. Son solo para personalizaciones más avanzadas del sitio.
4. **Generador de sitios estáticos:** Es el rol del programa, Jekyll en sí, escrito en ruby. Procesa todos los archivos anteriormente mencionados para generar el sitio estático.
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

## ¿Cómo se instala?

Primero, tenemos que instalar Ruby en el sistema. Las instrucciones cambian de acuerdo al sistema operativo.

### Ubuntu

Instalar ruby y los otros requisitos. 

```sh
sudo apt-get install ruby-full build-essential zlib1g-dev
```
**Qué instalo???:** los paquetes son el del lenguaje de programación ruby, el build-essential que tiene todos los programas para compilar y procesar código entre otros y zlib1g de compresión de la rama de desarrollo, de ahi el -dev. 
{: .notice--info}

Después se recomienda configurar unas variables de entorno del sistema operativo para que no se instalen los paquetes de Ruby (que se llaman *gems*).

```sh
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
**Qué ejecuto???:** El comando **echo** genera como salida los strings que se le pasan como argumento, a esos strings generados se los direcciona y adjunta (con **>>**) al final de archivo llamado *.bashrc* ubicado en la carpeta home *~* del usuario que ejecuta el comando. El efecto es el mismo que abrir el archivo .bashrc con un editor de texto y ponerle las 3 lineas al final entre las comillas. Luego el **source** se encarga de cargar esas nuevas variables de entorno al contexto del sistema. 
{: .notice--info}

Finalmente, instalamos los paquetes jekyll y bundler de Ruby para nuestro usuario:

```sh
gem install jekyll bundler
```

## ¿Cómo se usa?

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

Ahí vamos a poder ver todos los archivos generados. 

Para lanzar nuestro proyecto de ejemplo y verlo en el navegador ejecutamos:

```sh
bundle exec jekyll serve
```

Y si todo sale bien, deberíamos ver nuestro nuevo blogcito en [http://localhost:4000/](http://localhost:4000/).

Esta línea lo que hace es construir el sitio estático a partir de los archivos y levantar un servidor web local en el cual podemos visualizar el resultado del sitio generado.

**Apagando el sitio:** En la terminal que tenemos corriendo el servidor, podemos apretar Ctrl+C para que el proceso se detenga y ahi dejaremos de ver el blogcito en nuestra página. 
{: .notice--info}

### Segundo ejemplo: Minimal mistakes

Ahora vamos a bajar un projecto de internet para configurarlo a nuestro gusto, pero usando un ***Tema***. Los temas vienen con características extra y formatos de página preconfigurables para personalizar a gusto. En nuestro caso vamos a usar Minimal Mistakes.

**¿Por qué este tema?** Minimal Mistakes es un tema de Jekyll altamente personalizable y responsivo (esto es, se adapta a distintos tamaños de pantalla), además de tener características ya implícitas en el tema. Es una excelente opción para principiantes debido a su proceso de configuración bien documentado, su hermoso diseño y su versatilidad, permitiendo crear un sitio que se ve profesional sin mucho esfuerzo.
{: .notice--info}

Entonces, arrancamos con un proyecto nuevo. En un principio, hay 3 métodos para crear un nuevo sitio con este tema. Acá vamos a usar el [método del paquete gem](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/#gem-based-method) del tema a modo de ejemplo. Salimos de la carpeta actual y creamos un nuevo sitio.

```sh
cd ..
jekyll new minimal-test
code .
```
En nuestro editor, el Visual Studio Code, debemos ver los contenidos del proyecto. Allí podremos modificar el archivo  `Gemfile` añadiendo una línea para instalar la gema del tema en el proyecto.

```ruby
gem "minimal-mistakes-jekyll"
```

Ahora podemos ejecutar `bundle install` para instalar el tema.

#### Configuración

Lo primero que debemos hacer es editar el `_config.yml`. Este archivo contiene variables que definen cómo y con qué contenido se genera el sitio. Activa funcionalidades, define temas, navegación y mucho más. Podemos ver un ejemplo de todo lo que se puede configurar para este tema en el [default _config.yml](https://github.com/mmistakes/minimal-mistakes/blob/master/_config.yml) del repositorio del tema. 

De Minimal, debemos hacer primero estas modificaciones:

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
Luego, para que funcione debemos:

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

Una vez realizados nuestros cambios, podemos ejecutar el argumento _--livereload_ para que el programa revise los archivos y actualice automáticamente cualquier cambio en el sitio, regenerándolo y reflejando los cambios en el navegador donde estamos visualizando nuestro trabajo.

Con todo listo, podemos crear nuevas páginas para probar los distintos layouts y formatos que se pueden generar con este tema de Jekyll. Solo tenemos que tener cuidado de respetar el formato del nombre de los archivos markdown para las páginas tipo post **AAAA-MM-DD-nombre-de-post.md** y de seguir el formato del encabezado de los posts, conocido como [Front Matter](https://jekyllrb.com/docs/front-matter/). Este es un bloque que se encuentra al principio del archivo Markdown y define el estilo de página, entre otras configuraciones. No hace falta configurar todas las variables, pero hacerlo te da más posibilidades de personalizar cada post.

## Comentarios de cierre

En este tutorial básico, aprendiste cómo funcionan los generadores de sitios estáticos en general, y Jekyll en particular. Pudiste crear un sitio básico y uno usando un tema.

Todavía hay mucho más por aprender en cuanto a configuración del sitio y, sobre todo, la personalización usando las herramientas del tema. ¡Incluso se puede personalizar sobre la personalización ya presente en el tema! 

Pero por ahora, con lo que viste hasta acá, deberías poder empezar a usarlo, explorar las funcionalidades y aprovechar las opciones de personalización disponibles en este tema. Y si esto no te alcanza, o el tema no te convence, hay [miles para elegir](https://jekyllrb.com/docs/themes/#pick-up-a-theme), ¡sos libre de buscar uno que te guste!

Fuentes:

- [Jekyll](https://jekyllrb.com/)
- [Minimal mistakes theme](https://mmistakes.github.io/minimal-mistakes/)
