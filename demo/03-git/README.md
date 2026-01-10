# Git Demo

This is the history of commands that were demoed in class. It illustrates the collaborative work on two clones (copies) of the same repository. 

If you want to simulate this with your neighbor, invite them as a collaborator to your repo after you have created it on GitHub. See [GitHub's guide on inviting collaborators](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-user-account/managing-access-to-your-personal-repositories/inviting-collaborators-to-a-personal-repository).

## Setting up on computer 1

This could be in Codespace, or your local computer.

```bash
pwd
ls
ls -la
git init
ls -la
echo "Good morning" > greetings.txt
ls
ls -la
git status
git diff
git add .
git commit -m "morning"
git status
git add .
git commit -m "morning"
git status
git log

# Edit `greetings.txt` and save it.
echo "Good evening!" > greetings.txt

git status
git diff
git add .
git commit -m "evening"
git status
git log

# checkout the earlier commit indicated by "03280fe38" (use the first few characters of the commit hash from git log)
git checkout 03280fe38
cat greetings.txt
# notice the content has changed back to the earlier version

# switch back to latest on main branch
git checkout main
git status
git branch
git log
cat greetings.txt
git checkout 03280fe38
cat greetings.txt
git checkout main
cat greetings.txt
git checkout 03280fe38
git checkout main
git status

# Working on a new branch
git switch -c new_day
echo "Yet another day!" > greetings.txt
cat greetings.txt
git status
git add .
git commit -m "another day"
git log
git switch main
git log
git switch new_day
git branch -a
git remote -v

# add another file to main branch
git switch main
echo "Time to practice" > practice.txt
git branch
git add .
git commit -m "practice"
git switch new_day # no practice.txt on this branch
git switch main  # and practice.txt is back
```

Create repo demo-repo on GitHub. Then connect our local repo to it. By convention the remote is referred to as `origin`.
```bash
git remote add origin https://github.com/ksiller/demo-repo.git # replace with your url
git branch -a
# push our main branch to the remote (referred to as origin) on GitHub
git push origin main

# push all branches to the remote on GitHub
git push --all origin
```

## On computer 2

```bash
# clone the repo from GitHub; if you're in Codespace, cd to home dir first!
git clone https://github.com/ksiller/demo-repo.git
cd demo-repo
```
You only have to do this once. 

Continue...
```bash
# create a new file on this machine
echo "time for a break!" > break.txt
git add .
git commit -m "break"
ls
git log
git status
git push origin main
```

## Back to Computer 1

```bash
git status # make sure all local changes are committed, if not commit them before proceeding!
git log
git fetch origin main
git switch main # make sure we're on local main branch
git merge origin/main
git log
ls
```
Should now include break.txt

## Computer 2

```bash
echo "my version" > conflict.txt
git add .
git commit -m "my version"
git push origin main
git pull origin main --merge
history
history -100
history 100
```

## Back on computer 1

```bash
echo "another version" > conflict.txt
git add . 
git commit -m "my conflict 1"
git status
git log
```
So far so good. We created a new file not knowing that the remote repo had a recent update with the same file `conflict.txt` but different content.

```bash
git fetch origin main
git switch main
git merge origin/main
```
Boom! Git recognizes that the remote branch we want to merge into main has a different version of conflict.txt.

```bash
git log
git status
git diff
```
We resolve it in our code editor, and save it.

```bash
git add .
git commit -m "resolved conflict"
git push origin main
```