---
layout: single
title: "Version Control with Git in Plain Terms: Beginner-Friendly Tutorial"
lang: en
categories:
  - Principiante
tags:
  - Tutoriles
  - Git
  - GitHub
  - Colaboración
  - Jekyll
toc: true
toc_sticky: true
--- 

What a topic version control is! It's a classic problem that appears in a programmer's life when they start manually renaming files, including information about the new changes in the filename.

In software development, multiple files in various languages interact with each other for interpreted projects or are assembled in certain ways to create an executable in compiled projects. It's easy to see how the problem of versioning can become increasingly complex. Now, imagine how much more complicated it gets when coordinating many people's changes simultaneously and collaborating without breaking anything.

That's where the great computing pioneer, Linus Torvalds, came to the rescue. In 2005, he invented Git to better organize the development of the Linux kernel, and the rest is history (I don't say "was" because history is still being written and built every day — [check out how the legendary Linus commits!](https://github.com/torvalds/linux/commits?author=torvalds)).

Git is a distributed version control software that provides us with a set of tools to track changes, revert to previous states, develop new features in parallel, and, most importantly, collaborate with others without conflicts.

Well, without *too many* conflicts, because people are still part of the process. And hopefully, that will remain the case for a while.

The purpose of this article is to show how Git works, what it is used for, and, finally, wrap up with a step-by-step example of its implementation, whether for personal projects or collaborative development.

![The map of how Git works!](/assets/images/posts/2024-06-06-git_flujo_de_trabajo.png)

## Git and GitHub

### What is Git?

Git is a program that automates version control in software development. Visually, you can have your local copy of the project, test modifications in parallel, and create branches to work on different parts of the project without affecting the main version. Once the work is ready, you can move those changes to the main version through a process called "merge."
Finally, you push those changes to the remote repository, which can be hosted on platforms like GitHub or GitLab. This remote repository serves as the central location where all collaborators' changes are brought together.

### What is GitHub?

[GitHub](https://github.com/) is an online software development platform that lets you keep a copy of your repository in your account, functioning as a remote backup.

Together with Git, it allows you to have a central repository accessible via the internet, either public or private. You can share this repository with collaborators, giving them read-only access for private repositories or edit access for collaborators. Each collaborator is identified with their own account, which makes permission management easier.

Once you've cloned your repository locally, you can do whatever you want with it.

### Where Are Files Stored?

A project is nothing more than a set of files with different extensions that define how they execute or what they contain.

The directory (or folder) containing all the project's files that we interact with lives locally on our machine. There, you can use Git to version your work, saving "snapshots" of the project at different points in time. Git stores the change history in its folders, allowing you to track and revert modifications if necessary.

This history syncs when you decide to interact with the remote repository, uploading changes to share with your team members. Additionally, from this remote repository, you can create local copies of other branches and pull the latest changes your teammates have uploaded to the branches you're working on together.

### Git Workflow for Development

#### Creating or Cloning a Repository

Starting a new project or working on an existing one can be done in the following ways:

1. Creating a new repository:
   - Initialize a new local Git repository.
   - Optionally, create a remote repository on a platform like GitHub.
   - Link the local and remote repositories.

2. Cloning an existing repository:
   - Use the `git clone` command to copy a remote repository to your local machine.

When you clone, you're essentially copying the remote repository into a new local repository to work on that code.

#### Making Changes and Committing

As you work on your project, Git tracks changes to your files. The basic workflow follows these steps:

1. Modify files in your working directory.
2. Stage (or prepare) the changes you want to commit.
3. Commit the staged changes with descriptive messages.
4. Optionally, push the commits to a remote repository.

#### Collaborating with Others

When working on shared projects, the workflow often looks like this:

1. Pull the latest changes from the remote repository.
2. Create a new branch for your feature or bug fix.
3. Make and commit your changes.
4. Push the branch to the remote repository.
5. Create a pull request for review (if using a platform like GitHub).
6. Merge the changes after approval.

### Key Git Concepts

#### Repositories

A Git repository is a collection of files and their revision history. There are two types:

1. **Local repository**: Exists on your machine.
2. **Remote repository**: Hosted on a server, such as GitHub, GitLab, or Bitbucket.

Git does not automatically track all files in a project. Files can be in the following states:
   - **Untracked**: New files added to the project that Git is not yet following.
   - **Staged**: Files ready to be included in the next commit. Changes are staged using the `git add` command.
   - **Committed**: Changes that have been recorded in the repository's history. These are saved using the `git commit` command.
   - **Ignored**: Files that Git will not track, such as key files for resource access, large files, local configuration files, or auxiliary files created locally during development. These are specified in a hidden file at the root of the project called `.gitignore`.

#### Commits

A commit represents a specific point in the project's history. It includes:

- A unique identifier (hash).
- A commit message describing the changes made.
- A snapshot of the project at that moment.

#### Branches

Branches allow you to diverge from the main development line to work on new features or experiments independently, without affecting the main codebase.

#### Merging

Merging is the process of integrating changes from one branch into another, typically combining feature branches back into the main branch (main or master).

#### Remote Tracking

Git allows you to keep your local repository synchronized with remote repositories, facilitating collaboration and project backup.

### Best Practices

1. Commit frequently with clear and descriptive messages.
2. Use branches to develop new features or experiments.
3. Keep the main branch stable, always ready for building and deployment.
4. Review changes before merging.
5. Use `.gitignore` to exclude unnecessary files.
6. Pull changes from the remote repository regularly.
7. Resolve conflicts quickly and carefully.

By understanding these concepts and following best practices, you'll be well-equipped to use Git effectively, both for personal projects and collaborative development.

## Practical Tutorial: Setup and Contribution

This practical tutorial will guide you through the process of creating a new repository, setting up a Jekyll site, and making contributions using Git and GitHub. We will cover both command-line operations and integration with Visual Studio Code.

### Prerequisites

Before starting this tutorial, make sure you have:

1. Git installed on your system.
2. A GitHub account.
3. GitHub CLI (`gh`) installed.
4. Jekyll installed.
5. Visual Studio Code (VSCode) installed.

### Part 1: Command Line Operations

#### Step 1: Create a New Repository on GitHub

1. Open your terminal and log in to GitHub using the GitHub CLI:

   ```bash
   gh auth login

   Follow the prompts to complete the authentication process.

2. Create a new repository on GitHub:

   ```bash
   gh repo create my-jekyll-site --public
   ```
   This command creates a new public repository called "my-jekyll-site" in your GitHub account

#### Step 2: Clone the Repository Locally

1. Clone the newly created repository to your local machine:

   ```bash
   git clone https://github.com/your-username/my-jekyll-site.git
   cd my-jekyll-site
    ```
2. Inspect the contents of the `.git` directory:

   ```bash
   ls -la .git
   ```
   This command shows the internal structure of the Git repository.

#### Step 3: Configure Git for the Repository

Set up your username and email for this specific repository:

```bash
git config user.name "Your Name"
git config user.email "your.email@example.com"
```
#### Step 4: Initialize a New Jekyll Site

1. Create a new Jekyll site in the current directory:

   ```bash
   jekyll new . --force
   ```
2. Remove the default `index.markdown` file:

   ```bash
   rm index.markdown
   ```
3. Create a new `index.md` file with some content:

   ```bash
   echo "# Bienvenido a Mi Sitio Jekyll" > index.md
   echo "" >> index.md
   echo "Este es un nuevo sitio Jekyll creado para el tutorial." >> index.md
   ```

#### Step 5: Commit and Push Changes

1. Stage all changes:

   ```bash
   git add .
   ```

2. Commit the changes:

   ```bash
   git commit -m "Initial Jekyll site setup"
   ```

3. Push changes to GitHub:

   ```bash
   git push origin main
   ```

#### Step 6: Create a Pull Request

1. Create a new branch for your changes:

   ```bash
   git checkout -b update-homepage
   ```

2. Make a change to the `index.md` file:

   ```bash
    echo "" >> index.md
    echo "This line was added in a new branch." >> index.md
   ``

3. Commit and push the changes:

   ```bash
   git add index.md
   git commit -m "Update homepage content"
   git push origin update-homepage
   ```

4. Create a pull request using the GitHub CLI:

   ```bash
   gh pr create --title "Update homepage" --body "Added a new line to the homepage."
   ```

#### Step 7: Review and Merge the Pull Request

1. View the pull request

   ```bash
   gh pr view
   ```

2. Approve and merge the pull request:

   ```bash
   gh pr review --approve
   gh pr merge
   
Review the process and methodology for pull request reviews.

It’s common for beginners to break code in a branch, merge incorrect versions, or encounter conflicts during a merge. While learning, you might feel tempted to clone everything from scratch if the local setup breaks—I’ve been guilty of this too. If this happens, I recommend using an AI assistant. Explain the repository’s context, the problem, and the error shown in the terminal or VSCode. Then describe what you want to do, and the assistant will provide the necessary commands to resolve the issue. 
{: .notice--info}


### Part 2: Using Visual Studio Code

Now we’ll go through the same process using Visual Studio Code with the Source Control view and the GitHub Pull Request extension.

1. Open Visual Studio Code and navigate to the "Source Control" view (Ctrl+Shift+G).

2. If you have VSCode open, click on "Clone repository" and enter your GitHub repository URL.

![Source Control](/assets/images/posts/GH1.png)

3. Once cloned, you can make changes to your files directly in VSCode.

4. To stage changes, click the "+" icon next to the modified files in the Source Control view.

![Stage](/assets/images/posts/GH2.png)

5. To commit changes, enter a commit message in the text box and click the checkmark icon.

![Commit](/assets/images/posts/GH3.png)

6. To push changes, click the "..." menu in the Source Control view and select "Push."

![Push](/assets/images/posts/GH4.png)

7. To create a new branch, click on the branch name in the bottom-left corner and select "Create new branch."

![Branch](/assets/images/posts/GH5.png)

8. After making changes in the new branch, push the branch to GitHub.

9. Using the GitHub Pull Request extension (installed from the VSCode marketplace), you can create a new pull request by clicking the "Create Pull Request" button.

![Extension](/assets/images/posts/GH6.png)

Here we can see the changes made:

![Changes](/assets/images/posts/GH7.png)

We create the Pull Request:

![Pull Request](/assets/images/posts/GH8.png)

10. Review and merge the pull request directly from the GitHub Pull Request extension in VSCode.

## Forking, Branching, and Pull Requests

This section focuses on the process of contributing to an existing Jekyll site through forking, branching, and pull requests.

### Prerequisites

Before starting, make sure you have:

1. Git installed on your system.
2. A GitHub account.
3. Visual Studio Code (VSCode) installed.
4. Access to a Linux terminal (Ubuntu or WSL).

### Step 1: Fork the Repository

1. Go to the GitHub page of the Jekyll site repository you want to contribute to.
2. Click on the "Fork" button in the top-right corner of the page.

![Fork1](/assets/images/posts/Fork1.png)

You will see a message like this:

![Fork2](/assets/images/posts/Fork2.png)

3. GitHub will create a copy of the repository under your account.

For this part of the tutorial, you can use this [example repository](https://github.com/jeremiasbaezcarballo/git-en-criollo-tutorial) in my account.

### Step 2: Clone Your Forked Repository

At this point, you have forked the repository, which is a copy of a repository under your account. Any changes you make there are exclusively yours. Now let's see the normal workflow for this use case. 
This is how it is typically done when working on open collaborative free software development:

1. On the GitHub page of your forked repository, click on the "Code" button and copy the HTTPS URL.
2. Open your terminal and navigate to the directory where you want to clone the repository.
3. Run the following command, replacing `<URL>` with the copied URL:

```bash
git clone <URL>
```
4. Change to the newly created directory:

```bash
cd <repository-name>
```
### Step 3: Set Up the Upstream Remote

To keep your fork updated with the original repository, add it as an upstream remote:

```bash
git remote add upstream https://github.com/original-owner/original-repository.git
```
Verify the new remote:

```bash
git remote -v
```
### Step 4: Create a New Branch for Your Feature

Create and switch to a new branch for your feature:

```bash
git checkout -b feature-branch-name
```

### Step 5: Make Changes to Your Jekyll Site

1. Open the project in Visual Studio Code:

```bash
code .
```

2. Make the necessary changes to your Jekyll site's files.
3. Save your changes.

### Step 6: Stage and Commit Your Changes

1. Stage your changes:

```bash
git add .
```
2. Commit your changes with a descriptive message:

```bash
git commit -m "Add feature: description of your changes"
```
### Step 7: Push Your Changes to Your Fork

Push your feature branch to your forked repository on GitHub:

```bash
git push origin feature-branch-name
```
### Step 8: Merge Your Feature Branch

If you are satisfied with your changes and want to update the main branch of your fork:

1. Switch to the main branch:

```bash
git checkout main
```

2. Merge your feature branch:

```bash
git merge feature-branch-name
```

3. Push the changes to the main branch of your fork:

```bash
git push origin main
```
### Step 9: Create a Pull Request for the Original Repository

To contribute your changes back to the original repository:

1. Go to the GitHub page of your fork.
2. Click on "Pull requests" and then on "New pull request."

![Fork3](/assets/images/posts/Fork3.png)

3. Ensure that the base repository is the original repository and the head repository is your fork.
4. Select the branches you want to compare.
5. Click on "Create pull request."
6. Add a title and description for your pull request, explaining your changes. It should look like this:

![Fork4](/assets/images/posts/Fork4.png)

7. Click on "Create pull request" to submit. Once submitted, you should see something like this:

![Fork5](/assets/images/posts/Fork5.png)

## Conclusion

This comprehensive guide has covered the basics of Git, the process of forking and contributing to existing repositories, and provided a practical tutorial for setting up and contributing to a Jekyll site. By mastering these concepts and techniques, you will be well-equipped to effectively collaborate on Jekyll sites and other projects hosted on GitHub.

Remember to keep your fork updated with the upstream repository by regularly fetching and merging changes:

```bash
git fetch upstream
git checkout main
git merge upstream/main
```
As you gain experience, you will find that version control becomes an invaluable tool in your web development toolkit. Practice these steps regularly to become more comfortable with Git and GitHub operations, and feel free to explore more advanced features as you gain confidence in your skills.

For more information on Git and GitHub, refer to the [official Git documentation](https://git-scm.com/doc) and [GitHub Guides](https://guides.github.com/). {: .notice--info}

Always be careful when working with Git commands, especially when pushing changes to remote repositories or merging branches. Make sure to understand the implications of each action before proceeding. 
{: .notice--warning}