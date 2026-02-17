# Git Exercises
Exercise repo to go with the Git in Practice slides. 

Link to [slides](https://lizsalmon.github.io/iCSC-Git-talk/1)

## Exercise 1
During this exercise you will be able to find and **restore some lost history** and then **tidy up** a git history using an interactive rebase. 

Run these commands: 
```bash
curl -sSL https://raw.githubusercontent.com/lizsalmon/icsc-git-exercises/main/bash_scripts/level_1_init.sh | sh
cd cern_higgs_search
```
You are now in a local repository with just the main branch where we did find the higgs peak! But we have now lost the commit.  We may have accidentally reset? Oops! 

1. Using the tools from in the lecture - find the success commit
   - If the commit is not in the `git log` where else could it be?
3. Once you find the commit.  `cherry-pick`, `checkout` or `reset` to get that commit.  
   - Consider which of these would be the best way to preserve the commit history
   - Which would remove possibilities for conflicts? 
   - Optionally, try each and see the differences
        - To do this reset to the commit before you ran your command.  
   - Are there any other commands that could get the commit into the working directory?
4. Run `analyse_higgs.py` to see if you have found the peak. 
5. Tidy up the history using `git rebase -i`
   - Try to make your git history look like this:
```
a865bec (HEAD -> main) SUCCESS: HIGGS FOUND AT 125GeV!!
938190b Initial commit: start project
```

## Exercise 2

Run these commands: 
```bash
curl -sSL https://raw.githubusercontent.com/lizsalmon/icsc-git-exercises/main/bash_scripts/level_2_init.sh | sh
cd student_work
```
(dont worry if you get a warning about an empty repo)

**The repository:**
- You will see three different versions of the same repo.  
  - `cern_central_server`: This is acting as the "remote repository"
  - `student_work`: This is your clone of the `cern_central_server` repo
  - `dr_bohr_work`: This is your co-workers clone of the `cern_central_server` repo
- You are working on a feature branch called `feature/better-plots`.  You have made some changes to the files and committed them on your local branch.
- Your co-worker has also made some critical changes in their clone and pushed the changes to main. 

You need to update your version of main and then merge those changes into your branch. 

1. Check that you are in your clone and on the main branch.
   - Should be in folder `student_work`
   - Should be on branch `main` (check this with `git status` or `git branch`)
3. Run a `git log` and have a look at the commits 
4. Run a fetch to update your local version of `origin/main` with the version on the remote, run `git fetch origin main`
5. Then merge that version into your local version of `main` by running `git merge origin/main`
6. Now look at the commits that are in the `git log`.  You should see the commit that has come from your co-worker.
7. Now switch to be on your branch (`feature/better-plots`)
8. `git merge main` into your branch 
   - Dont forget to add and commit if there are any conflicts
   - Which changes do you want to keep? The ones from the critical commit or from your "manual tweak"
   - You should now be able to see a merge commit in your `git log`
9. Push your changes to your branch on the origin: `git push origin feature/better-plots`
    - This should create a new branch

You have just successfully implemented a (merge) feature branch workflow! You could now open a Pull request on the remote to merge your branch into main!

**Extension**

It turns out that you didnt read the developers guide and you arent supposed to leave merge commits in the repo.  So we need to rebase instead :( But dont worry! This is why git is cool - everything is "undo-able".

1. Get rid of your merge commit using a `git reset --hard`
   - You will have to find the commit hash of before the merge commit
2. Now rebase your branch onto main instead by running `git rebase main`
   - You will again get some conflicts
   - It is the exact same conflict except now `HEAD` is the change on `main`.  This is as a rebase is applying commits on top - as opposed to a merge (ask me if you want me to give a better explanation of this)
   - We still need to `git add` the file and run `git rebase --continue`.
   - Now look at the log to see the difference between a `merge` and a `rebase`
4. Push your changes to your branch on origin 
   - Why does a plain push not work 
   - What can we use instead?

## Exercise 3

For this **optional** exercise please see the repo [here](https://github.com/lizsalmon/icsc-git-training) and follow the instructions in the README.

