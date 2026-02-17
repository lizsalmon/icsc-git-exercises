# icsc-git-exercises
Exercise repo to go with the Git in Practice slides. 



## Level 1

Run these commands: 
```bash
curl -sSL https://raw.githubusercontent.com/lizsalmon/icsc-git-exercises/main/bash_scripts/level_1_init.sh | sh
cd cern_higgs_search
```
You are now in a repository where we know we did find the higgs peak! But we have now lost the commit. 

1. Using the tools from in the lecture - how could we find that commit? 
2. Once you find the commit.  `cherry-pick`, `rebase` or `reset` to get that commit.  
3. Run `analyse_higgs.py` to see if you have found the peak. 
4. Tidy up the history using `git rebase -i` 

## Level 2

Run these commands: 
```bash
curl -sSL https://raw.githubusercontent.com/lizsalmon/icsc-git-exercises/main/bash_scripts/level_2_init.sh | sh
cd student_work
```
1. Fetch your local version of main
2. checkout your branch `feature/better-plots`
3. `git merge` main into your branch 
   - Dont forget to add and commit 
4. Push your changes to origin
5. Actually... we dont want merge commits.  Get rid of your merge commit using a `git reset`
   - You will have to find the commit hash of before the merge commit
6. Now rebase your branch onto main instead
7. Push your changes to origin (why does it not work with a plain push)
