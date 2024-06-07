---
title: "Introducción a Git ATP"
last_modified_at: 2024-05-29T20:20:02-03:00
categories:
  - Blog
tags:
  - principiantes
  - tutoriales
  - 
--- 

Que tema el control de versiones. Es un clásico que arranca en la vida de uno cuando empieza a cambiarle el nombre a los archivos a mano, con información de los cambios nuevos en el nombre.

<img src="https://scontent.fcor10-4.fna.fbcdn.net/v/t1.6435-9/58382451_2607037732674873_2772353492092715008_n.png?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_ohc=HSyEofeE6DoQ7kNvgHtPcPf&_nc_ht=scontent.fcor10-4.fna&oh=00_AYDKHT2FGz6CaetNyrldjOEt8ejbbJvhUc8rX8-Tqupvmg&oe=6689E435" />


Teniendo en cuenta que en el desarrollo de software se utilizan comunmente multiples archivos en multiples lenguajes que interactúan funcionalmente entre sí en ejecución para los interpretados o encastran de cierta forma para generar un ejecutable para los compilados es fácil ver que el problema del versionado se complica aún más. Ahora imaginate como se complica si hay que coordinar los cambios de mucha gente al mismo tiempo y colaborar cuanto más se puede llegar a complicar.

Ahi fue donde llegó al rescate el gran prócer de la computación Linus Torvalds e inventó Git en 2005 para ayudar a desarrollar mas ordenado el kernel de linux y el resto es historia (no digo fué, porque se sigue construyendo y escribiendo día a día, [mira como commitea el loco Laaaiiinuuuusss!](https://github.com/torvalds/linux/commits?author=torvalds)) 

Git es un software de control de versiones que nos provee de un conjunto de herramientas para tener un seguimiento de cambios, poder volver atrás a estados previos de un conjunto de archivos, desarrollar cosas nuevas en paralelo y sobre todo trabajar con otras personas sin conflictos. Bah sin tantos conflictos, las personas seguimos estando involucradas en el proceso. Y esperemos que así siga por un tiempo.

La idea de este artículo es mostrar como funciona, para que se usa y finalmente cerrar con un ejemplo para implementar paso a paso.

## Como funciona?

### Conceptos

- **Repositorios**: Un repositorio de Git es donde se almacenan todos los archivos de tu proyecto y todo el historial de cambios de esos archivos. Hay dos tipos de repositorios: locales (en tu computadora) y remotos (en un servidor, como [GitHub](https://github.com/)).

- **Commits**: Un commit es una foto de tu repositorio en un momento específico. Cada commit tiene una ID única e incluye un mensaje que describe los cambios. Los commits te permiten registrar y seguir los cambios en tu proyecto.

- **Ramas**: Las ramas son líneas de desarrollo separadas en tu proyecto. La rama predeterminada se llama `main` o `master`, pero puedes crear ramas adicionales para trabajar en nuevas características o correcciones sin afectar la base de código principal.

- **Merges**: Fusionar es el proceso de integrar cambios de una rama en otra. Esto te permite combinar el trabajo de diferentes ramas y asegurar que todos los cambios se incluyan en el proyecto final.

#### El Flujo de Trabajo
Entender el flujo de trabajo de Git es clave para un control de versiones efectivo. Aquí tienes un flujo de trabajo típico:

1. **Repositorio Local vs. Repositorio Remoto**: Tu repositorio local está en tu computadora, mientras que el repositorio remoto está en un servidor como GitHub. Puedes sincronizar los cambios entre ellos usando comandos de Git.

2. **Las Etapas de los Cambios en los Archivos**:
   - **No Rastreado - _untracked_**: Archivos nuevos agregados al proyecto que Git aún no está vigilando.
   - **Preparado - _added_**: Archivos que están marcados para ser incluidos en el próximo commit. Preparas los cambios usando el comando `git add`.
   - **Cometido - _commited_**: Cambios que han sido registrados en el historial del repositorio. Cometes cambios usando el comando `git commit`.

3. **Operaciones Básicas de Git**:
   - **Crear un Repositorio**: Puedes crear un nuevo repositorio de Git usando `git init`.
   - **Clonar un Repositorio**: Para trabajar en un proyecto existente, puedes clonar un repositorio remoto usando `git clone`.
   - **Rastrear Cambios**: Puedes agregar cambios al área de preparación con `git add` y cometerlos al repositorio con `git commit`.
   - **Ver el Historial**: Usa `git log` para ver el historial de commits en tu repositorio.
   - **Crear y Fusionar Ramas**: Crea nuevas ramas con `git branch` y cámbiate a ellas con `git checkout`. Fusiona cambios con `git merge`.
   - **Colaborar con Otros**: Usa `git pull` para obtener y fusionar cambios desde un repositorio remoto, y `git push` para subir tus cambios.



# Tutorial Práctico

## Introducción

Se van a recorrer tres casos de uso principales de Git:

1. Configurar Git para un proyecto local prexistente.
2. Clonar de un proyecto existente desde GitHub.
3. Hacer un fork de un proyecto en GitHub.

Usaremos el tema Minimal Mistakes de Jekyll para todos los ejemplos.

## Prerrequisitos

- Git instalado en el sistema.
- Cuenta en GitHub.
- Visual Studio Code (VSCode) instalado.

### Parte 1: Configurar Git para un proyecto local prexistente

#### Paso 1: Descargar y Configurar el Proyecto
1. **Descargar el tema Minimal Mistakes de Jekyll:**
   - Visita la [página ejemplo de GitHub de Minimal Mistakes](https://github.com/mmistakes/mm-github-pages-starter).
   - Descarga el [archivo zip](https://github.com/mmistakes/mm-github-pages-starter/archive/refs/heads/master.zip) y extráelo en un directorio llamado `minimal-mistakes`.

2. **Moverse al directorio del proyecto:**
   ```bash
   cd minimal-mistakes
   ```

3. **Probar que funcione el sitio**

   ```bash
   bundle install
   bundle exec jekyll serve
   ```

Si llega a aparecer un error con un componente _webrick_ ejecutar _bundle add webrick_. Es una librería de Ruby para generar servidores simples de HTTP.
{: .notice--danger}

#### Paso 2: Inicializar un Repositorio Git

1. **Inicializar Git:**
Aca es un punto interesante para ver que pasa cuando agregamos git a un proyecto, el control de versiones en sí. Podemos revisar que archivos se crean.

   ```bash
   ls -la
   git init
   ls -la
   ```

Deberiamos ver que entre el primer listado de contenidos del directorio y el segundo, aparece la carpeta .git que contiene toda la info del repo. Podes revisar sus contenidos para ver que tiene. 

2. **Agregar todos los archivos al repositorio:**

Ahora, esto inicializo los archivos de git localmente, lo que necesitamos ahora es añadir los archivos al control de versiones, esto es decirle a git de que archivos tiene que estar pendiente de los cambios.
   ```bash
   git status
   git add .
   git status
   ```

Aca deberiamos poder ver como añadimos todos esos archivos 

3. **Hacer un commit de la configuración inicial:**
Hacemos el commit, sacamos una foto al estado de todos los archivos y sus contenidos en este momento.

   ```bash
   git commit -m "Commit inicial con el tema Minimal Mistakes"
   ```

Ese commit queda localmente guardado, y ya pertenece al histórico de cambios que podemos observar.


   ```bash
   git log
   ```

4. **Crear un repositorio en GitHub llamado `git-local-project-demo` y conectarlo:**

Ahora bien, esto indica que puedo tener un control local de versiones, pero lo que interesa es poder trabajar colaborativamente online, y para eso debemos tener un repositorio remoto de donde obtener los cambios de los demas, y al cual yo voy a subir mis cambios. 

Antes de eso, debemos hacer login a nuestra cuenta de Github desde la terminal, para poder tener acceso al almacenamiento propio de mi cuenta desde mi máquina local. Para esto lo mas fácil es usando github CLI, que es un paquete para manejar tu cuenta de github con la linea de comandos. Los pasos de la instalación están [aquí](https://github.com/cli/cli/blob/trunk/docs/install_linux.md). Por comodidad, dejo los de Debian/Ubuntu aqui. 

```bash
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```


Que comando largo no? No hace falta saber todo lo que hace pero en resumen, es una serie de comandos que se ejecutan en orden para instalar cosas que necesita _gh_, agregar una firma para asegurar la integridad y seguridad del paquete que estamos bajando para instalar, e indicandole al sistema que debe escanear el repositorio donde se guarda ese paquete que vamos a instalar cada vez que revisamos las actualizaciones del sistema. Y al ultimo lo instala.
{: .notice--info}

No confundir _gh_ con _git_. Uno es para manejar la cuenta y la conexión de nuestra máquina a nuestra cuenta, y el otro para operar sobre los contenidos del repositorio.
{: .notice--warning}


Para eso entonces, añadimos un repositorio remoto creado en tu cuenta propia de github, reemplazando _usuario_ por tu nombre de usuario.

   ```bash
   git remote add origin https://github.com/usuario/git-local-project-demo.git
   git push -u origin main
   ```

#### Paso 3: Crear una Nueva Rama, Hacer un Commit de Cambios y Crear un Pull Request
1. **Crear y cambiar a una nueva rama:**
   ```bash
   git checkout -b cambios-mayo
   ```

2. **Hacer un pequeño cambio (por ejemplo, actualizar README.md):**
   - Editar el archivo README.md, o el contenido de algunos posts usando VSCode.

3. **Agregar, hacer commit y subir los cambios:**
   ```bash
   git add README.md
   git commit -m "Actualizado README con detalles del proyecto"
   git push --set-upstream origin feature-update
   ```

4. **Crear un pull request en GitHub:**
   - Ve a tu repositorio en GitHub.
   - Haz clic en el botón "Compare & pull request".
   - Crea el pull request.

5. **Fusionar el pull request:**
   - En GitHub, revisa el pull request y haz clic en "Merge pull request".

6. **Eliminar la rama:**
   ```bash
   git branch -d feature-update
   git push origin --delete feature-update
   ```

### Parte 2: Clonar un Proyecto Existente desde GitHub

#### Paso 1: Eliminar el Repositorio Local
1. **Eliminar el repositorio local existente:**
   ```bash
   cd ..
   rm -rf minimal-mistakes
   ```

#### Paso 2: Clonar el Repositorio desde GitHub
1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/tuusuario/git-local-project-demo.git
   cd git-local-project-demo
   ```

#### Paso 3: Crear una Nueva Rama, Hacer un Commit de Cambios y Crear un Pull Request
1. **Crear y cambiar a una nueva rama:**
   ```bash
   git checkout -b feature-update-2
   ```

2. **Hacer otro cambio (por ejemplo, actualizar otro archivo):**
   - Editar otro archivo usando VSCode.

3. **Agregar, hacer commit y subir los cambios:**
   ```bash
   git add .
   git commit -m "Actualizado otro archivo"
   git push --set-upstream origin feature-update-2
   ```

4. **Crear, revisar, fusionar el pull request y eliminar la rama:**
   - Sigue los mismos pasos que en la Parte 1.

### Parte 3: Realizar un Fork de un Proyecto en GitHub

#### Paso 1: Realizar un Fork del Proyecto Original
1. **Realizar un fork del repositorio Minimal Mistakes:**
   - Ve a la [página de GitHub de Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes).
   - Haz clic en el botón "Fork" en la parte superior derecha.

2. **Clonar tu repositorio forked:**
   ```bash
   git clone https://github.com/tuusuario/minimal-mistakes.git
   cd minimal-mistakes
   ```

#### Paso 2: Crear una Nueva Rama, Hacer un Commit de Cambios y Crear un Pull Request
1. **Crear y cambiar a una nueva rama:**
   ```bash
   git checkout -b feature-update-3
   ```

2. **Hacer un cambio (por ejemplo, actualizar un archivo de configuración):**
   - Editar un archivo de configuración usando VSCode.

3. **Agregar, hacer commit y subir los cambios:**
   ```bash
   git add .
   git commit -m "Actualizado archivo de configuración"
   git push --set-upstream origin feature-update-3
   ```

4. **Crear un pull request:**
   - Ve a tu repositorio forked en GitHub.
   - Haz clic en "Compare & pull request".
   - Crea el pull request a tu repositorio forked.

5. **Fusionar el pull request y eliminar la rama:**
   - Sigue los mismos pasos que antes.

### Conclusión
En este tutorial, aprendiste a:
- Configurar y añadir Git a un proyecto local existente.
- Clonar un proyecto existente desde GitHub.
- Realizar un fork de un proyecto en GitHub.
- Crear nuevas ramas, hacer commits de cambios, crear pull requests, fusionarlos y eliminar ramas para simular el flujo de trabajo diario de desarrollo.

Al practicar estos pasos, obtendrás una comprensión sólida de cómo usar Git para el control de versiones en tus proyectos. ¡Feliz codificación!

---

Este tutorial proporciona una guía práctica y detallada en español para que los estudiantes de secundaria comprendan y practiquen el uso de Git en escenarios del mundo real.