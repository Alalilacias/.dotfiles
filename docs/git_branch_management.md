To manage branches in Git, you can follow these steps:

### 1. **Create a New Branch**
First, make sure you are in the main branch (`main` or `master`):

```bash
git checkout main
```

Then create a new branch and switch to it:

```bash
git checkout -b new-branch-name
```

This creates a new branch named `new-branch-name` and switches you to that branch.

### 2. **Make Your Changes**
Now, you can work on this branch and commit your changes as usual:

```bash
git add .
git commit -m "Your commit message"
```

### 3. **Push the Branch to GitHub**
By default, branch creation is local, so to ensure the branch is also available on GitHub, you need to push it:

```bash
git push origin new-branch-name
```

This will notify GitHub of the new branch, and it will now exist in the remote repository.

### 4. **Merge the Branch with Main**
Once you're done with your changes and have pushed them, you can merge the branch back into the main branch:

```bash
git checkout main
git pull origin main  # Update your local main branch with any changes from the remote
git merge new-branch-name
```

### 5. **Push the Merged Main Branch**
After merging, push the updated `main` branch to GitHub:

```bash
git push origin main
```

### 6. **Delete the Old Branch**
Once the branch has been merged, you can safely delete it locally:

```bash
git branch -d new-branch-name
```

And then delete it from GitHub as well:

```bash
git push origin --delete new-branch-name
```
