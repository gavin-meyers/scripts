Git Guide
=========

###Pull/Commit/Push Commands
```
git pull --rebase
git add "File Names individually" 
git commit -m "Message for the Commit" 
git pull --reabse
git push origin master
```

###Feature Branching (Fast-Forward Merge)
Start a New Feature (in a New Branch) && Add/Edit Some Files
```
git branch # List branches in the repo with current branch
git checkout -b <branchname> # Create a new branch and switch to it

git add <file>
git commit -m "Start a feature"
```

###Push the new-feature to Master 
```
git push origin <branchname> # Push the branch to your remote repository
```

### Rebase & Merge the new-feature branch
```
git checkout master
git pull --rebase
git merge <branchname>

git push origin master
```

### To Move between Branch & Master
```
git checkout <branchname>
git checkout master
```

###Delete the new-feature branch
```
git branch -d <branchname> # Delete the feature branch:

```

###Productivity Commands
```
git diff # Compare Staging area and What’s last been committed
git whatchanged -n 1 # To View Last Commit Logs 
git status # List the files you've changed and those you still need to add or commit
git remote -v # List all currently configured remote repositories
```
