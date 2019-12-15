# Git

Git is a source control management tool that helps to keep track of changes made to a codebase.

## Initialisation

### Clone a repository

!!! Info "Why"
    - I would like to make a local copy of code from a public repository I found online.

```sh
# for http-based
git clone https://zephinzer@github.com/zephinzer/blog.joeir.net

# for ssh-based
git clone ssh://git@github.com/zephinzer/blog.joeir.net
```

### Create a new repository

!!! Info "Why"
    - I would like to initialise a new Git repository on my computer.

```sh
git init
```

## Remote management

### Add a Git remote

!!! Info "Why"
    - I would like to add a new remote named `origin` to my repository.

```sh
git remote add origin ssh://git@github.com/zephinzer/blog.joeir.net
```

### Update the Git remote

!!! Info "Why"
    - I would like to update the URL for my remote named `origin` in my repository.

```sh
git remote set-url origin ssh://git@github.com/zephinzer/blog.joeir.net
```

## Retrieving changes

### Fetch changes

Fetching retrieves the changes but **does not** merge the changes with your local copy.

!!! Info "Why"
    I would like to get updates from the remote but I don't want to update my code yet.

```sh
git fetch
```

### Merge changes

Merging takes the remote changes that have been fetched from the remote and merges them with your local copy.

!!! Info "Why"
    I have reviewed the changes I retrieved from the remote and I want to update my local code to match the remote's copy now.

```sh
git merge HEAD
```

### Pull changes

Pulling basically does a fetch and merge.

!!! Info "Why"
    I would like to update my code so that it is the same as the remote's.

```sh
git pull
```

### Pull with Rebase

Pulling with rebase does a fetch, but before merging in the remote changes, it rolls back to a state before all remote changes were made, applies the remote changes, and then applies your local changes.

!!! Info "Why"
    I would like to update my code by placing whatever's from the remote before my current changes so that it is the same as the remote's and I don't have a merge commit.

```sh
git pull -r
```

### Rebase

!!! Info "Why"
    - I would like to pull in changes from another branch that's available locally and place those changes before the changes I've committed.

```sh
# assuming we are on branch feature_x pulling in updates from master
git rebase master
```

## Saving changes

### Stashing

!!! Info "Why"
    - I would like to temporarily store my unstaged changes so that I can pull in the latest updates from the remote.

```sh
# put all unstaged changes into a stash
git stash

# checking stashed changes
git stash list

# popping the last stashed change
git stash pop
```

### Staging

!!! Info "Why"
    - I would like to add file(s) that will be 'saved' during a commit.

```sh
# to stage all changes, run this from project root
git add .

# to stage only one file
git add ./path/to/changed_file
```

### Commiting

!!! Info "Why"
    - I would like to save my changes to my local Git repository.

```sh
git commit -m 'some message'
```

### Commiting without any changes

!!! Info "Why"
    - I would like to add a commit to my local repository without adding any files
    - I would like to have a commit that can trigger a pipeline in the remote source control

```sh
git commit --allow-empty 'some message'
```

## Modifying changes

### Adding a file to a previous commit

!!! Info "Why"
    - I forgot to run `git add` on a file that should be in the previous commit.

```sh
# stage the missing file first
git add ./path/to/missed/file;

# this will add the staged file to the previous commit
git commit --amend
```

### Squash commit

!!! Info "Why"
    - I have made 5 commits and I would like to compress them into a single commit so my Git history is cleaner.

```sh
# indicate `p` or `pick` for the head commit, and `s` or `squash` for the rest
git rebase -i HEAD~5
```

### Uncommit last commit

!!! Info "Why"
    - I would like to reverse the last commit but leave changes I made intact

```sh
# this will leave the committed files as staged
git reset --soft HEAD^

# this will also unstage all changes
git reset HEAD^
```

### Reverting a commit

!!! Info "Why"
    - I would like to create a commit that reverses the changes in a certain commit with hash `${COMMIT_HASH}`

```sh
# use `git log` to find the commit hash of the commit you wish to undo the effects of
git revert ${COMMIT_HASH}
```

## Submitting changes

### Pushing

!!! Info "Why"
    - I would like push all committed changes from my computer to the remote

```sh
git push
```

### Force Pushing

!!! Info "Why"
    - I have modified a commit locally and am unable to push normally to the remote since I rewrote history (**WARNING**: this will erase any changes others may have made between when the original commit was made, and your current commits)

```sh
git push -f
```

## Assessing changes

### View all current changes

!!! Info "Why"
    - I would like to see what files have been staged

```sh
git status
```

### View commit history

!!! Info "Why"
    - I want to do an interactive rebase (squashing) and I would like to see which commit I should rebase up till
    - I want to see what changes have been made by other team members/developers

```sh
# interactive browsing of git commits
git log

# output only the last 5 logs
git log -n 5
```

### View difference between commits

!!! Info "Why"
    - I would like to check out what changes have been made between two commits

```sh
# view file changes from HEAD to ${COMMIT_HASH}
git diff HEAD ${COMMIT_HASH}
```

## Viewing repository information

### View the Git configuration

!!! Info "Why"
    - I would like to see who am I committing code as

```sh
git config -l
```

### Check which branch you're on

!!! Info "Why"
    - I would like to confirm which branch I am on

```sh
git branch
```

### See all remotes

!!! Info "Why"
    - I would like to see which remotes I am pushing to

```sh
git remote -v
```

### Checking which `.gitignore` is ignoring a file

!!! Info "Why"
    - I would like to know which `.gitignore` is causing a file to be ignored without any obvious reason

```sh
cd `./path/to`;
git check-ignore -v *;
```
