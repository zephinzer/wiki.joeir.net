# Git

Git is a source control management tool that helps to keep track of changes made to a code base.

## Initialisation

### Cloning a repository

I would like to make a local copy of code from a public repository I found online.

```sh
# for http-based
git clone https://zephinzer@github.com/zephinzer/blog.joeir.net

# for ssh-based
git clone ssh://git@github.com/zephinzer/blog.joeir.net
```

### Creating a new repository

I would like to initialise a new Git repository on my computer.

```sh
git init
```

## Remote management

### Adding a Git remote

I would like to add a new remote named `origin` to my repository.

```sh
git remote add origin ssh://git@github.com/zephinzer/blog.joeir.net
```

### Updating the Git remote

I would like to update the URL for my remote named `origin` in my repository.

```sh
git remote set-url origin ssh://git@github.com/zephinzer/blog.joeir.net
```

## Retrieving changes

### Fetching

I would like to get updates from the remote but I don't want to update my code yet.

```sh
git fetch
```

### Merging

I have reviewed the changes I retrieved from the remote and I want to update my local code to match the remote's copy now.

```sh
git merge HEAD
```

### Pulling: Fetching + Merging

I would like to update my code so that it is the same as the remote's.

```sh
git pull
```

### Pull with Rebase

I would like to update my code by placing whatever's from the remote before my current changes so that it is the same as the remote's and I don't have a merge commit.

```sh
git pull -r
```

### Rebase

Rebasing is useful for feature branches to pull in changes from master.

```sh
# assuming we are on branch feature_x pulling in updates from master
git rebase master
```

## Saving changes

### Stashing

```sh
# put all unstaged changes
git stash
```

### Staging

```sh
# to stage all changes, run this from project root
git add .

# to stage only one file
git add ./path/to/changed_file
```

### Commiting

```sh
git commit -m 'some message'
```

### Commiting without any changes

```sh
git commit --allow-empty 'some message'
```

## Modifying changes

### Adding a file to a previous commit

I forgot to run `git add` on a file that should be in the previous commit.

```sh
# stage the missing file first
git add ./path/to/missed/file;

# this will add the staged file to the previous commit
git commit --amend
```

### Squash commit

- I have made 5 commits and I would like to compress them into a single commit so my Git history is cleaner.

```sh
# indicate `p` or `pick` for the head commit, and `s` or `squash` for the rest
git rebase -i HEAD~5
```

### Uncommit last commit

- I would like to reverse the last commit but leave changes I made intact

```sh
# this will leave the committed files as staged
git reset --soft HEAD^

# this will also unstage all changes
git reset HEAD^
```

### Reverting a commit

- I would like to create a commit that reverses the changes in a certain commit with hash `${COMMIT_HASH}`

```sh
# use `git log` to find the commit hash of the commit you wish to undo the effects of
git revert ${COMMIT_HASH}
```

## Submitting changes

### Pushing

- I would like push all committed changes from my computer to the remote

```sh
git push
```

### Force Pushing

- I have modified a commit locally and am unable to push normally to the remote since I rewrote history (**WARNING**: this will erase any changes others may have made between when the original commit was made, and your current commits)

```sh
git push -f
```

## Assessing changes

### View all current changes

```sh
git status
```

### View commit history

```sh
# interactive browsing of git commits
git log

# output only the last 5 logs
git log -n 5
```

### View difference between commits

```sh
# view file changes from HEAD to ${COMMIT_HASH}
git diff HEAD ${COMMIT_HASH}
```

## Viewing repository information

### View the Git configuration

```sh
git config -l
```

### Check which branch you're on

```sh
git branch
```

### See all remotes

```sh
git remote -v
```

### Checking which `.gitignore` is ignoring a file

> Assuming there exists file `./path/to/file` that's ignored, how can we know which `.gitignore` is causing it to be excluded from Git?

```sh
cd `./path/to`;
git check-ignore -v *;
```
