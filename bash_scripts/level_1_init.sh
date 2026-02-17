#!/bin/bash

# 1. Setup the directory
mkdir -p cern_higgs_search
cd cern_higgs_search
git init --initial-branch=main  -q

# 2. Initial (Empty) State
cat <<EOF > analyse_higgs.py
import numpy as np
import matplotlib.pyplot as plt

# TODO: Add data generation
EOF
git add analyse_higgs.py
git commit -m "Initial commit: start project" -q

# 3. A messy "WIP" commit
cat <<EOF > analyse_higgs.py
import numpy as np
import matplotlib.pyplot as plt

background = np.random.exponential(scale=50, size=10000)
# signal = ? 
EOF
git add .
git commit -m "WIP" -q

# 4. Another "fix" commit with a typo
cat <<EOF > analyse_higgs.py
import numpy as np
import matplotlib.pyplot as plt

background = np.random.exponential(scale=50, size=10000)
plt.hist(background, bins=100)
plt.title("Plot without signal")
EOF
git add .
git commit -m "fix" -q

# 5. The Discovery
cat <<EOF > analyse_higgs.py
import numpy as np
import matplotlib.pyplot as plt

background = np.random.exponential(scale=50, size=10000)
mu, sigma = 125, 2 
signal = np.random.normal(mu, sigma, size=500)
data = np.concatenate([background, signal])

plt.figure(figsize=(10, 6))
plt.hist(data, bins=100, range=(50, 200), histtype='step', label='LHC Data')
plt.axvline(125, color='red', linestyle='--', label='125 GeV')
plt.title("Plot with signal")
plt.legend()
plt.show()
plt.savefig("higgs_discovery.png")
EOF
git add .
git commit -m "SUCCESS: HIGGS FOUND AT 125GeV!!" -q

# 6. One more minor tweak before the "disaster"
echo "# Final calibration check" >> analyse_higgs.py
git add .
git commit -m "minor tweak to comments" -q

# 7. THE SABOTAGE (The "Accidental" Reset)
# We move back 2 commits, effectively "losing" the discovery and the tweak.
git reset --hard HEAD~2 -q

# 8. Adding more "noise" to the history after the reset
echo "print('Searching for Higgs...')" >> analyse_higgs.py
git add .
git commit -m "re-trying the analysis from scratch" -q
echo "print('Still no signal found...')" >> analyse_higgs.py
git add .
git commit -m "add logging" -q

echo "----------------------------------------------------------"
echo "The Higgs discovery has been lost in the logs!"
echo "Your mission: Find the lost SUCCESS commit,"
echo "restore it, and then clean up the history."
echo "----------------------------------------------------------"
