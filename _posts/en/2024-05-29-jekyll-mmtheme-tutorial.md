---
title: "Jekyll: Friendly Static Websites"
last_modified_at: 2024-05-29T20:20:02-03:00
lang: en
categories:
  - Principiante
tags:
  - Tutoriales Herramientas
---
## A bit of history

I never knew much about Frontend. I know it has many frameworks that ultimately generate stacks of HTML files anyway. I never intended to learn how they work because web design doesn't appeal to me, so I actively stayed away from the field.

That was until, recommended on YouTube by Techno Tim, a great content creator, I discovered [Jekyll](https://jekyllrb.com/), a static website and blog generator that only required Markdown-formatted content to generate those boring HTMLs!

## So, how does this work?

Jekyll is a static site generator written in Ruby that takes configurations (.yml) and Markdown files (.md) and converts them into all the necessary documents for a static website. The files we edit are plain text—no struggling with sophisticated frontend frameworks. It’s designed to be simple, flexible, and easily integrable with GitHub Pages, which makes it popular for personal blogs and project documentation.

**Static sites:** Unlike dynamic sites, users cannot interact with the site content. For example, filling out forms, logging in, etc. Since it doesn't generate content in real time from a database, static sites are faster, safer, and easier to deploy.
{: .notice--info}

### Markdown

Markdown is a language that provides basic formatting for plain text. It is designed to be easy to write, read, and hassle-free. It allows you to create titles, lists, links, images, quotes, and more with very simple syntax.  
It is widely used for project documentation, writing blog posts, sending emails, and on GitHub. It's compatible with a ton of tools and, since you don't need complex editors, it’s ideal when you want something quick and effective.

### Liquid Templates

Liquid is a templating language created by Shopify that Jekyll uses to process and render your site's pages. It allows you to use placeholders and logic in your templates, making your site dynamic without relying on a backend server. Templates can have different post styles and layouts, giving you more flexibility to customize your site as you like. Generally, this tool is useful for making deeper changes to the original theme.

### How it works

The key elements of this static site generator are:

1. **Source files:** These include Markdown, HTML, and other components you want to add to your site (images, CSS, or JavaScript).
2. **Configuration files:** The main one is `_config.yml`, containing all the site configurations.
3. **Templates:** Layouts and Includes (which are page structures and libraries) typically written in Liquid. Initially, you don’t need to create these files since they come with the theme. When created, they usually overwrite the default theme files. They are meant for more advanced customizations.
4. **Static site generator:** This is the program itself—Jekyll, written in Ruby—which processes all the mentioned files to generate the static site.
5. **Output:** The generated static site files are usually located in the `_site/` directory.

![How it works](/assets/images/posts/2024-05-29-jekyll-site-generation-process.png)

### Directory Structure

Below is the list of files and folders that collectively make up the structure of a Jekyll site:

- `_config.yml`: Configuration file.
- `_posts/`: Your blog posts written in Markdown format.
- `_layouts/`: Design templates that define your site's structure.
- `_includes/`: Reusable components like headers or footers.
- `_site/`: The compiled output of your site.
- `index.md` or `index.html`: The main page of your site.

### Benefits

- **Simplicity:** No databases or server-side code required.
- **Performance:** Fast loading times since everything is pre-rendered.
- **Security:** Reduced attack surface compared to dynamic sites.
- **Flexibility:** Highly customizable through themes and plugins.
- **Integration with GitHub Pages:** Free and easy hosting.

## How to install?

First, we need to install Ruby on the system. The instructions vary by operating system.

### Ubuntu

Install Ruby and other prerequisites.

```sh
sudo apt-get install ruby-full build-essential zlib1g-dev
```
**What am I installing?:** These packages include the Ruby programming language, build-essential (which contains all the tools for compiling and processing code), and zlib1g-dev, the development branch of compression tools. 
{: .notice--info}

Then, it is recommended to set some system environment variables to avoid installing Ruby packages (called *gems*) globally.

```sh
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
**What does this do?:** The **echo** command outputs the strings passed as arguments, and these strings are redirected and appended (with **>>**) to the end of the *.bashrc* file located in the user’s home directory *~*. This has the same effect as opening the .bashrc file with a text editor and adding these lines at the end. Then, **source** loads these new environment variables into the system context. 
{: .notice--info}

Finally, install the Ruby packages jekyll and bundler for your user:

```sh
gem install jekyll bundler
```
## How to use it?

### First example

To create a new site in the current directory:
```sh
jekyll new blog
```
This will create a folder with an example project. We can navigate to the directory and open it with VSCode:

```sh
cd new blog
code .
```
Here we will see all the generated files.

To launch our example project and view it in the browser, run:

```sh
bundle exec jekyll serve
```
If everything goes well, we should see our new blog at [http://localhost:4000/](http://localhost:4000/).

This command builds the static site from the files and starts a local web server to preview the generated site.

**Stopping the site:** In the terminal where the server is running, press Ctrl+C to stop the process, and the blog will no longer be available. 
{: .notice--info}

### Second example: Minimal Mistakes

Now, let’s download a project from the internet and configure it as we like, but using a ***Theme***. Themes come with extra features and pre-configured page layouts for customization. In our case, we’ll use Minimal Mistakes.

**Why this theme?** Minimal Mistakes is a highly customizable and responsive Jekyll theme (i.e., it adapts to different screen sizes) with many built-in features. It’s an excellent choice for beginners due to its well-documented setup process, beautiful design, and versatility, allowing you to create a professional-looking site with minimal effort. 
{: .notice--info}

Let’s start a new project. Initially, there are three methods to create a site with this theme. Here, we’ll use [the gem-based method](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/#gem-based-method) as an example. Exit the current folder and create a new site:

```sh
cd ..
jekyll new minimal-test
code .
```
In our editor (VSCode), we should see the project contents. Here, we’ll modify the `Gemfile` by adding a line to install the theme gem in the project.

```ruby
gem "minimal-mistakes-jekyll"
```
Now run `bundle install` to install the theme.

### Configuration`

The first thing to do is edit `_config.yml`. This file contains variables that define how the site is generated and what content it includes. It activates features, defines themes, navigation, and much more. You can find an example of all the possible configurations for this theme in the default [default _config.yml](https://github.com/mmistakes/minimal-mistakes/blob/master/_config.yml) from the theme’s repository.

For Minimal Mistakes, make the following initial changes:

```yaml
theme: minimal-mistakes-jekyll

# Site configuration
title: My Blog
description: A blog about ...
author: Your Name
email: your-email@example.com

# Build settings
markdown: kramdown
highlighter: rouge
```
Then:

1. Replace index.md with an index.html file containing the following content:

```
---
layout: home
author_profile: true
---
```

2. Change **layout: post** in the example post _posts/0000-00-00-welcome-to-jekyll.markdown to **layout: single**.

The layout defines the style og a specific page, whether it's a post or auxiliary navigation pages like categories and tags. 
{: .notice--info}

3- Delete _about.md_ or at least change the references that say **layout:page** to **layout:single**.

Finally, run:

```sh
bundle exec jekyll serve --livereload
```
Once we’ve made our changes, using the __--livereload__ argument makes the program monitor the files and automatically update the site when changes are made, reflecting them in the browser where we’re previewing our work.

With everything set up, we can create new pages to experiment with the different layouts and formats this Jekyll theme offers. Just make sure to follow the naming convention for Markdown files for post pages **YYYY-MM-DD-post-name.md** and use the [Front Matter format](https://jekyllrb.com/docs/front-matter/). This block at the beginning of a Markdown file defines the page style, among other settings. While not all variables need to be configured, doing so allows more customization for each post.

## Closing remarks

In this basic tutorial, you learned how static site generators work in general, and Jekyll in particular. You created a basic site and one using a theme.

There’s still a lot to learn about site configuration and especially personalization using theme tools—even customizing over the existing theme customization!

But for now, with what you’ve seen so far, you should be able to start using Jekyll, exploring its features, and taking advantage of the customization options available in this theme. And if this isn’t enough or the theme doesn’t suit you, there are [thousands to choose](https://jekyllrb.com/docs/themes/#pick-up-a-theme). feel free to find one you like!

Sources:

- [Jekyll](https://jekyllrb.com/)
- [Minimal Mistakes Theme](https://mmistakes.github.io/minimal-mistakes/)
