# Git Basics

## User setup

- `git config --global user.name "Your Name"`
- `git config --global user.email "your@email"`

## Clone a GitHub repository

- `git clone https://github.com/timothywarner/inebootcamp.git`

## Check local repository status

- `git status`
- `git remote -v`

## Add upstream remote

- `git remote add upstream https://github.com/owner/repo.git`

## Update your fork and local repos

- `git pull upstream main`
- `git push origin main`

## Create a new feature branch and switch to it

- `git checkout -b timwarner-feature1`

## Verify your branch

- `git branch`

## Stage and unstage files & changes

- `git add .`
- `git reset script.ps1`

## Commit change

- `git commit -m "Add a good commit message"`

## View commit log

- `git log`

## Inspect changes

`git diff script.ps1`

## Uncommit change

- `git reset HEAD~1`

## Rebase

- let main get ahead of feature branch
- `git rebase main`

## Merge locally

- `git checkout main`
- `git merge featurebranch`
- `git log`

## Squash merge

- `git checkout main`
- `git merge --squash featurebranch`
- `git commit -m "Took multiple actions"`
- `git log`

## Push your change to your fork

- `git push -u origin timwarner-feature1`

