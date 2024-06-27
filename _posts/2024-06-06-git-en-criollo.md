---
layout: single
title: "Control de versiones con Git en criollo: Tutorial ATP y APB"
last_modified_at: 2024-05-29T20:20:02-03:00
categories:
  - Blog
  - Git
tags:
  - Git
  - GitHub
  - Control de Versiones
  - Colaboración
  - Jekyll
toc: true
toc_sticky: true
--- 


Que tema el control de versiones. Es un clásico problema que aparece en la vida de uno cuando empieza a cambiarle el nombre a los archivos a mano, con información de los cambios nuevos en el nombre.

Teniendo en cuenta que en el desarrollo de software se utilizan comunmente multiples archivos en multiples lenguajes que interactúan funcionalmente entre sí en ejecución para los interpretados o encastran de cierta forma para generar un ejecutable para los compilados es fácil ver que el problema del versionado se complica aún más. Ahora imaginate como se complica si hay que coordinar los cambios de mucha gente al mismo tiempo y colaborar cuanto más se puede llegar a complicar.

Ahi fue donde llegó al rescate el gran prócer de la computación Linus Torvalds e inventó Git en 2005 para ayudar a desarrollar mas ordenado el kernel de linux y el resto es historia (no digo fué, porque se sigue construyendo y escribiendo día a día, [mira como commitea el loco Laaaiiinuuuusss!](https://github.com/torvalds/linux/commits?author=torvalds))

Git es un software de control de versiones distribuido que nos provee de un conjunto de herramientas para tener un seguimiento de cambios, poder volver atrás a estados previos de un conjunto de archivos, desarrollar cosas nuevas en paralelo y sobre todo trabajar con otras personas sin conflictos. 

Bah sin tantos conflictos, las personas seguimos estando involucradas en el proceso. Y esperemos que así siga por un tiempo.

La idea de este artículo es mostrar como funciona, para que se usa y finalmente cerrar con un ejemplo para implementar paso a paso, ya sea para proyectos personales o desarrollo colaborativo. 

![El mapa de como funciona Git!](/assets/images/posts/2024-06-06-git_flujo_de_trabajo.png)

## Git y Github

### ¿Qué es Git?

Es un programa para automatizar el control de versiones. Visualmente, yo puedo tener mi copia local del proyecto, probar modificaciones en paralelo, moverlas a la version cuando creemos que el trabajo este listo y finalmente subir esos cambios a la principal que está en un servidor remoto (Puede ser Github o Gitlab). Ese repositorio remoto es donde se juntan todos los cambios de los colaboradores involucrados.

### ¿Que es Github?

[Github](https://github.com/) es una plataforma de desarrollo de software online. Ahi se puede tener una copia de nuestro repositorio en nuestra cuenta, es un backup remoto. 

En conjunto con Git, nos permite tener el repositorio central accesible por internet, publico o privado, que se puede compartir con colaboradores para darles acceso de lectura para los privados, o acceso de edición a colaboradores (que se identifican con su propia cuenta) para poder editar y hacer modificaciones en el repositorio online.

Con tu repositorio local, podes hacer lo que quieras una vez esta clonado. 

### ¿Donde se guardan los archivos?

Un proyecto no es mas que un conjunto de archivos con información con distintas extensiones que definen como se ejecutan o que contienen. 

El directorio (o carpeta) que contiene todos los archivos del proyecto con el que interactuamos vive localmente en nuestra maquina. Ahi podemos usar versionado local para tener las distintas fotos del proyecto y sus archivos en distintos momentos. Lo que git guarda en sus carpetas es el historial de cambios. 

Ese historial luego se sincroniza cuando queremos interactuar con el repositorio remoto subiendo cambios, que es compartido entre los miembros de un equipo de trabajo. 

A su vez de este remoto podemos crear copias locales de otros branches, y traernos los ultimos cambios que hayan subido nuestros compañeros en los branches que trabajamos en conjunto. 

### Flujo de Trabajo de Git para Desarrollo

#### Creando o Clonando un Repositorio

Para comenzar un nuevo proyecto o trabajar en uno existente se puede hacerlo:

1. Creando un nuevo repositorio:
   - Inicializá un nuevo repositorio de Git localmente
   - Opcionalmente, creá un repositorio remoto en una plataforma como GitHub
   - Vinculá los repositorios local y remoto

2. Clonando un repositorio existente:
   - Usá el comando `git clone` para copiar un repositorio remoto a tu máquina local

Cuando uno clona, lo que hace es justamente clonar el repositorio remoto a un nuevo repositorio local para trabajar sobre ese código.

#### Haciendo Cambios y Commiteando

A medida que trabajás en tu proyecto, Git rastrea los cambios en tus archivos. El flujo de trabajo básico involucra:

1. Modificar archivos en tu directorio de trabajo
2. Stagear los cambios que querés commitear
3. Commitear los cambios stageados con mensajes descriptivos
4. Opcionalmente, pushear los commits a un repositorio remoto

#### Colaborando con Otros

Cuando trabajás en proyectos compartidos:

1. Pulleá los últimos cambios del repositorio remoto
2. Creá una nueva rama para tu feature o corrección de bug
3. Hacé y commiteá tus cambios
4. Pusheá la rama al repositorio remoto
5. Creá un pull request para revisión (si usás una plataforma como GitHub)
6. Mergeá los cambios después de la aprobación

### Conceptos Clave de Git

#### Repositorios

Un repositorio de Git es una colección de archivos y su historial de revisiones. Hay dos tipos:

1. Repositorio local: Existe en tu máquina
2. Repositorio remoto: Alojado en un servidor (por ejemplo, GitHub, GitLab, Bitbucket)

No a todos los archivos git los tiene en cuenta para esto. Los estados del archivo pueden ser:

   - **No Rastreado - _untracked_**: Archivos nuevos agregados al proyecto que Git aún no está vigilando.
   - **Preparado - _added_**: Archivos que están marcados para ser incluidos en el próximo commit. Preparas los cambios usando el comando `git add`.
   - **Cometido - _commited_**: Cambios que han sido registrados en el historial del repositorio. Cometes cambios usando el comando `git commit`.
   - **Ignorados - _ignored_**: Archivos que git va a ignorar para el control de versiones. Por ejemplo, archivos de claves para conexión y acceso a recursos, archivos demasiado grandes, configuraciones locales o archivos auxiliares que se crean localmente durante el desarrollo. Estos se detallan en un archivo oculto en la raiz del proyecto llamado .Gitignore.


#### Commits

Un commit representa un punto específico en la historia del proyecto. Incluye:

- Un identificador único (hash)
- Un mensaje de commit describiendo los cambios
- Una instantánea del proyecto en ese punto

#### Ramas

Las ramas te permiten divergir de la línea principal de desarrollo y trabajar en features o experimentos de forma independiente.

#### Merging

El merging es el proceso de integrar cambios de una rama a otra, típicamente combinando ramas de features de vuelta a la rama principal.

#### Seguimiento Remoto

Git te permite mantener tu repositorio local sincronizado con repositorios remotos, permitiendo colaboración y backup.

### Mejores Prácticas

1. Commiteá frecuentemente con mensajes claros y descriptivos
2. Usá ramas para nuevas features o experimentos
3. Mantené la rama principal estable , compilando y desplegable
4. Revisá los cambios antes de mergear
5. Usá `.gitignore` para excluir archivos innecesarios
6. Pulleá regularmente los cambios del repositorio remoto
7. Resolvé conflictos rápida y cuidadosamente

Al entender estos conceptos y seguir las mejores prácticas, estarás bien equipado para usar Git efectivamente tanto para proyectos personales como para desarrollo colaborativo.

## Tutorial Práctico: Configuración y Contribución

Este tutorial práctico te guiará a través del proceso de crear un nuevo repositorio, configurar un sitio Jekyll y hacer contribuciones usando Git y GitHub. Cubriremos tanto operaciones de línea de comandos como integración con Visual Studio Code.

### Prerrequisitos

Antes de comenzar este tutorial, asegurate de tener:

1. Git instalado en tu sistema
2. Una cuenta de GitHub
3. GitHub CLI (`gh`) instalado
4. Jekyll instalado
5. Visual Studio Code (VSCode) instalado

### Parte 1: Operaciones de Línea de Comandos

#### Paso 1: Crear un Nuevo Repositorio en GitHub

1. Abrí tu terminal e iniciá sesión en GitHub usando GitHub CLI:

   ```bash
   gh auth login
   ```

   Seguí las indicaciones para completar el proceso de autenticación.

2. Creá un nuevo repositorio en GitHub:

   ```bash
   gh repo create mi-sitio-jekyll --public
   ```

   Este comando crea un nuevo repositorio público llamado "mi-sitio-jekyll" en tu cuenta de GitHub.

#### Paso 2: Clonar el Repositorio Localmente

1. Cloná el repositorio recién creado a tu máquina local:

   ```bash
   git clone https://github.com/tu-usuario/mi-sitio-jekyll.git
   cd mi-sitio-jekyll
   ```

2. Examiná el contenido del directorio `.git`:

   ```bash
   ls -la .git
   ```

   Este comando te mostrará la estructura interna del repositorio Git.

#### Paso 3: Configurar Git para el Repositorio

Configurá tu nombre de usuario y email para este repositorio específico:

```bash
git config user.name "Tu Nombre"
git config user.email "tu.email@ejemplo.com"
```

#### Paso 4: Inicializar un Nuevo Sitio Jekyll

1. Creá un nuevo sitio Jekyll en el directorio actual:

   ```bash
   jekyll new . --force
   ```

2. Eliminá el archivo `index.markdown` predeterminado:

   ```bash
   rm index.markdown
   ```

3. Creá un nuevo archivo `index.md` con algo de contenido:

   ```bash
   echo "# Bienvenido a Mi Sitio Jekyll" > index.md
   echo "" >> index.md
   echo "Este es un nuevo sitio Jekyll creado para el tutorial." >> index.md
   ```

#### Paso 5: Commitear y Pushear Cambios

1. Stageá todos los cambios:

   ```bash
   git add .
   ```

2. Commiteá los cambios:

   ```bash
   git commit -m "Configuración inicial del sitio Jekyll"
   ```

3. Pusheá los cambios a GitHub:

   ```bash
   git push origin main
   ```

#### Paso 6: Crear un Pull Request

1. Creá una nueva rama para tus cambios:

   ```bash
   git checkout -b actualizar-homepage
   ```

2. Hacé un cambio en el archivo `index.md`:

   ```bash
   echo "" >> index.md
   echo "Esta línea fue agregada en una nueva rama." >> index.md
   ```

3. Commiteá y pusheá los cambios:

   ```bash
   git add index.md
   git commit -m "Actualizar contenido de la página principal"
   git push origin actualizar-homepage
   ```

4. Creá un pull request usando GitHub CLI:

   ```bash
   gh pr create --title "Actualizar página principal" --body "Agregada una nueva línea a la página principal."
   ```

#### Paso 7: Revisar y Mergear el Pull Request

1. Visualizá el pull request:

   ```bash
   gh pr view
   ```

2. Aprobá y mergeá el pull request:

   ```bash
   gh pr review --approve
   gh pr merge
   ```

Es común para las primeras veces que rompamos el codigo en una rama, o combinemos mal las versiones, o un merge de código da conflictos y nos abatatemos para resolverlo mientras estamos aprendiendo. Cuando el local esta roto, puede surgir la tentación de clonar todo de cero nuevamente, soy culpable de hacerlo. Pero, hoy por hoy si te pasa, te recomiendo antes usar un asistente de IA, explicando el contexto del repositorio, el problema y finalmente el error que nos esta dando la terminal o VSCode. Y despues le decis que queres hacer y que te pase los comandos para hacerlo.
{: .notice--info}

### Parte 2: Usando Visual Studio Code

Ahora, vamos a pasar por el mismo proceso usando Visual Studio Code con la vista de Control de Código Fuente y la extensión de GitHub Pull Request.

1. Abrí Visual Studio Code y navegá a la vista "Control de código fuente" (Ctrl+Shift+G).

2. Hacé clic en "Clonar repositorio" e ingresá la URL de tu repositorio de GitHub.

3. Una vez clonado, podés hacer cambios en tus archivos directamente en VSCode.

4. Para stagear cambios, hacé clic en el ícono "+" junto a los archivos modificados en la vista de Control de código fuente.

5. Para commitear cambios, ingresá un mensaje de commit en el cuadro de texto y hacé clic en el ícono de tilde.

6. Para pushear cambios, hacé clic en el menú "..." en la vista de Control de código fuente y seleccioná "Push".

7. Para crear una nueva rama, hacé clic en el nombre de la rama en la esquina inferior izquierda y seleccioná "Crear nueva rama".

8. Después de hacer cambios en la nueva rama, pusheá la rama a GitHub.

9. En la extensión GitHub Pull Request (instalada desde el marketplace de VSCode), podés crear un nuevo pull request haciendo clic en el botón "Crear Pull Request".

10. Revisá y mergeá el pull request directamente desde la extensión GitHub Pull Request en VSCode.

## Forking, Branching y Pull Requests

Esta sección se enfoca en el proceso de contribuir a un sitio Jekyll existente a través de forking, branching y pull requests.

### Prerrequisitos

Antes de comenzar, asegurate de tener:

1. Git instalado en tu sistema
2. Una cuenta de GitHub
3. Visual Studio Code (VSCode) instalado
4. Acceso a una terminal Linux (Ubuntu o WSL)

### Paso 1: Forkear el Repositorio

1. Navegá a la página de GitHub del repositorio del sitio Jekyll al que querés contribuir.
2. Hacé clic en el botón "Fork" en la esquina superior derecha de la página.
3. GitHub creará una copia del repositorio bajo tu cuenta.

Para esta parte del tutorial podes usar este [repositorio de ejemplo](https://github.com/jeremiasbaezcarballo/git-en-criollo-tutorial) en mi cuenta.

### Paso 2: Clonar Tu Repositorio Forkeado

En este momento, vos hiciste un fork que seria una copia de un repositorio propia dentro de tu cuenta. Todo lo que modifiques ahi, es exclusivamente tuyo. Ahora vamos a ver como es el flujo de trabajo normal para este caso de uso. Asi se hace para trabajar en el desarrollo de software libre abierto colaborativo normalmente.

1. En la página de GitHub de tu repositorio forkeado, hacé clic en el botón "Code" y copiá la URL HTTPS.
2. Abrí tu terminal y navegá al directorio donde querés clonar el repositorio.
3. Ejecutá el siguiente comando, reemplazando `<URL>` con la URL copiada:

```bash
git clone <URL>
```

4. Cambiá al directorio recién creado:

```bash
cd <nombre-del-repositorio>
```

### Paso 3: Configurar el Remoto Upstream

Para mantener tu fork actualizado con el repositorio original, agregalo como un remoto upstream:

```bash
git remote add upstream https://github.com/propietario-original/repositorio-original.git
```

Verificá el nuevo remoto:

```bash
git remote -v
```

### Paso 4: Crear una Nueva Rama para Tu Feature

Creá y cambiá a una nueva rama para tu feature:

```bash
git checkout -b nombre-rama-feature
```

### Paso 5: Hacer Cambios a Tu Sitio Jekyll

1. Abrí el proyecto en Visual Studio Code:

```bash
code .
```

2. Hacé los cambios necesarios a los archivos de tu sitio Jekyll.
3. Guardá tus cambios.

### Paso 6: Stagear y Commitear Tus Cambios

1. Stageá tus cambios:

```bash
git add .
```

2. Commiteá tus cambios con un mensaje descriptivo:

```bash
git commit -m "Agregar feature: descripción de tus cambios"
```

### Paso 7: Pushear Tus Cambios a Tu Fork

Pusheá tu rama de feature a tu repositorio forkeado en GitHub:

```bash
git push origin nombre-rama-feature
```

### Paso 8: Mergear Tu Rama de Feature

Si estás satisfecho con tus cambios y querés actualizar la rama principal de tu fork:

1. Cambiá a la rama principal:

```bash
git checkout main
```

2. Mergeá tu rama de feature:

```bash
git merge nombre-rama-feature
```

3. Pusheá los cambios a la rama principal de tu fork:

```bash
git push origin main
```

### Paso 9: Crear un Pull Request para el repo de otro

Para contribuir tus cambios de vuelta al repositorio original:

1. Andá a la página de GitHub de tu fork.
2. Hacé clic en "Pull requests" y luego en "New pull request".
3. Asegurate de que el repositorio base sea el repositorio original y el repositorio head sea tu fork.
4. Seleccioná las ramas que querés comparar.
5. Hacé clic en "Create pull request".
6. Agregá un título y descripción para tu pull request, explicando tus cambios.
7. Hacé clic en "Create pull request" para enviar.

## Conclusión

Esta guía completa ha cubierto los fundamentos de Git, el proceso de forkear y contribuir a repositorios existentes, y ha proporcionado un tutorial práctico para configurar y contribuir a un sitio Jekyll. Al dominar estos conceptos y técnicas, estarás bien equipado para colaborar efectivamente en sitios Jekyll y otros proyectos alojados en GitHub.

Recordá mantener tu fork actualizado con el repositorio upstream fetcheando y mergeando cambios regularmente:

```bash
git fetch upstream
git checkout main
git merge upstream/main
```

A medida que ganes experiencia, encontrarás que el control de versiones se convierte en una herramienta invaluable en tu kit de herramientas de desarrollo web. Practicá estos pasos regularmente para sentirte más cómodo con las operaciones de Git y GitHub, y no dudes en explorar características más avanzadas a medida que ganes confianza en tus habilidades.

Para más información sobre Git y GitHub, consultá la [documentación oficial de Git](https://git-scm.com/doc) y las [Guías de GitHub](https://guides.github.com/).
{: .notice--info}


Siempre sé cuidadoso cuando trabajés con comandos de Git, especialmente al pushear cambios a repositorios remotos o mergear ramas. Asegurate de entender las implicaciones de cada acción antes de proceder.
{: .notice--warning}




