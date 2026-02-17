#!/bin/bash

# 1. Create a "Remote" Bare Repository (The CERN Server)
mkdir cern_central_server
cd cern_central_server
git init --bare -q
cd ..

# 2. Setup the Student's Local Repo
git clone cern_central_server student_work -q
cd student_work

# 3. Create the initial code
cat <<EOF > analyze_higgs.py
import numpy as np
import matplotlib.pyplot as plt

# PHYSICS CONSTANTS
BG_SCALE = 50
SIGNAL_MU = 125

def run_analysis():
    data = np.random.exponential(scale=BG_SCALE, size=10000)
    plt.hist(data, bins=100)
    plt.title("Higgs Search")
    plt.show()
    plt.savefig("plot.png")

run_analysis()
EOF
git add .
git commit -m "Initial stable analysis code" -q
git push origin main -q # Push to our "server"

# 4. Dr. Bohr pushes to the server
# We do this by creating a temporary clone to mimic another person
cd ..
git clone cern_central_server dr_bohr_work -q
cd dr_bohr_work
sed -i 's/BG_SCALE = 50/BG_SCALE = 42  # Updated from new sensor data/' analyze_higgs.py
git add .
git commit -m "CRITICAL: Updated background calibration constants" -q
git push origin main -q
cd ..

# 5. They make their own changes on a branch
cd student_work
git checkout -b feature/better-plots -q
sed -i 's/BG_SCALE = 50/BG_SCALE = 55  # My manual tweak/' analyze_higgs.py
sed -i 's/plt.hist(data, bins=100)/plt.hist(data, bins=150, color="green")/' analyze_higgs.py
git add .
git commit -m "Improved plot resolution and changed color" -q

echo "----------------------------------------------------------"
echo "LEVEL 2 REPO READY"
echo "You are working in /student_work"
echo "1. You are on branch 'feature/better-plots'."
echo "2. Dr. Bohr has pushed changes to 'main' on the server."
echo "3. Try to merge 'main' into your branch."
echo "----------------------------------------------------------"
