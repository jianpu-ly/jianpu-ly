#!/bin/bash
git pull --no-edit
wget -N http://people.ds.cam.ac.uk/ssb22/mwrhome/jianpu-ly.py

(
    awk -- 'BEGIN {p=1} /^Run jianpu-ly / {p=0} // {if(p) print}' < README.md
    python jianpu-ly.py --markdown
    ) > n && mv n README.md

git commit -am update && git push
