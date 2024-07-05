#!/usr/bin/env bash

\cd `git rev-parse --show-toplevel`
source .github/shell-utils.sh
update_progress_plot
xdg-open .github/progress.pdf &
git add .github
git status

echo -n "Commit and push? [y/n] "; read ans

if [ "$ans" == "y" ]; then
    git commit -am "`date`"
    git push origin recovery
fi

\cd - > /dev/null