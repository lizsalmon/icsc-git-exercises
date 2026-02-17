# icsc-git-exercises
Exercise repo to go with the Git in Practice slides. 

Link to [slides](https://lizsalmon.github.io/iCSC-Git-talk/1)



## Level 1

Run these commands: 
```bash
curl -sSL https://raw.githubusercontent.com/lizsalmon/icsc-git-exercises/main/bash_scripts/level_1_init.sh | sh
cd cern_higgs_search
```
You are now in a repository where we know we did find the higgs peak! But we have now lost the commit. 

1. Using the tools from in the lecture - how could we find that commit? 
2. Once you find the commit.  `cherry-pick`, `checkout` or `reset` to get that commit.  
   - Consider which of these would be the best way to preserve the commit history
   - Which would remove possibilities for conflicts? 
   - Optionally, try each and see the differences
   - Are there any other commands that could get the commit into the working directory?
3. Run `analyse_higgs.py` to see if you have found the peak. 
4. Tidy up the history using `git rebase -i` 

## Level 2

Run these commands: 
```bash
curl -sSL https://raw.githubusercontent.com/lizsalmon/icsc-git-exercises/main/bash_scripts/level_2_init.sh | sh
cd student_work
```
(dont worry if you get a warning about an empty repo)
1. Fetch your local version of main, run `git fetch origin main`
2. `git merge origin/main` into your branch 
   - Dont forget to add and commit if there are any conflicts
3. Push your changes to your branch on the origin
4. Actually... we dont want merge commits.  Get rid of your merge commit using a `git reset`
   - You will have to find the commit hash of before the merge commit
5. Now rebase your branch onto main instead
6. Push your changes to origin 
   - Why does a plain push not work 
   - What can we use instead? 
