#!/usr/bin/env bash

# git-sample-repo-create.sh from within http://github.com/wilsonmar/git-utilities.
# by Wilson Mar (wilsonmar@gmail.com
# This creates and populates a sample repo for my "Git and GitHub" tutorial,
# Explained at https://wilsonmar.github.io/git-commands-and-statuses/)

# Sample call in Terminal shell window:
# chmod +x git-sample-repo-create.sh
# ./git-sample-repo-create.sh

# TODO: Fix

TMP='git-sample-repo'
echo "*** STEP 01: Delete \"$TMP\" remnant from previous run:"
clear
echo "**********************************************************"
# Go to absolute path to avoid errors:
#cd ~/gits/git-utilities/
rm -rf ${TMP}
mkdir ${TMP}
cd ${TMP}
echo $git s 
ls -al

echo "*** STEP Init repo :"
git init
# return the .git path of the current project::
git rev-parse --git-dir

echo "*** STEP Config:"
# See https://git-scm.com/docs/pretty-formats :
git config user.name "Wilson Mar"
git config user.email "wilsonmar@gmail.com"
# echo "$GIT_COMMITTER_EMAIL=" $GIT_COMMITTER_EMAIL
# echo $GIT_AUTHOR_EMAIL
# Verify settings:
git config user.name
git config user.email
git config core.filemode false

# On Unix systems, ignore ^M symbols created by Windows:
# git config core.whitespace cr-at-eol

# Change default commit message editor program to Sublime Text (instead of vi):
git config core.editor "~/Sublime\ Text\ 3/sublime_text -w"

# Allow all Git commands to use colored output, if possible:
git config color.ui auto

# See https://git-scm.com/docs/pretty-formats :
git config alias.l "log --pretty='%Cred%h%Creset %C(yellow)%d%Creset | %Cblue%s%Creset | (%cr) %Cgreen<%ae>%Creset' --graph"
git config alias.s "status -s"
git config alias.w "show -s --quiet --pretty=format:'%Cred%h%Creset | %Cblue%s%Creset | (%cr) %Cgreen<%ae>%Creset'"

# Have git diff use mnemonic prefixes (index, work tree, commit, object) instead of standard a and b notation:
git config diff.mnemonicprefix true

# Dump config file:
# git config --list

echo "*** STEP First commit: a"
touch README.md
git add .
git commit -am "a"

echo "*** STEP Second commit:"
echo ".DS_Store">>.gitignore
git status
git add .
# git status
git commit -m "b"
git l

echo "*** STEP Third commit: branch F1"
git tag v1
git checkout v1 -b F1
git branch
git l

echo "*** STEP Fourth commit: c"
echo "MIT">>LICENSE.md
git add .
git commit -m "c"
git l

echo "*** STEP commit: d"
echo "d">>file-d.txt
git add .
git commit -m "d"
git l

echo "*** STEP Merge:"
git checkout master
#git merge F1 --no-commit
# git merge F1 --no-ff <:q
git merge F1 --no-ff
# Manually type ":q" to exit merge.
git branch
git l

echo "*** $NOW Remove Merge branch ref:"
# git branch -d F1
#  git branch
# git l

echo "*** STEP commit: e"
echo "e">>file-e.txt
git add .
git status
git commit -m "e"
git l

echo "*** STEP commit: f"
echo "f">>file-f.txt
ls -al
git add .
git commit -m "f"


# Undo last commit, preserving local changes:
# git reset --soft HEAD~1

# Undo last commit, without preserving local changes:
# git reset --hard HEAD~1

# Undo last commit, preserving local changes in index:
# git reset --mixed HEAD~1

# Undo non-pushed commits:
# git reset origin/master

# Reset to remote state:
# git fetch origin
# git reset --hard origin/master


echo "Copy this and paste to a text edit for reference: --------------"
git l
echo "*** Reflog: ---------------------------------------"
git reflog

echo "*** $NOW show HEAD :"
git w HEAD
echo "*** $NOW show HEAD~1 :"
git w HEAD~1
echo "*** $NOW show HEAD^ :"
git w HEAD^
echo "*** $NOW show HEAD^1 :"
git w HEAD^1
echo "*** $NOW show HEAD~2 :"
git w HEAD~2
echo "*** $NOW show HEAD^^ :"
git w HEAD^^
echo "*** $NOW show HEAD^2 :"
git w HEAD^2
echo "*** $NOW show HEAD~3 :"
git w HEAD~3
echo "*** $NOW show HEAD^^^ :"
git w HEAD^^^
echo "*** $NOW show HEAD^3 :"
git w HEAD^3
echo "*** $NOW show HEAD~4 :"
git w HEAD~4
echo "*** $NOW show HEAD~1^1 :"
git w HEAD~1^1
echo "*** $NOW show HEAD~1^2 :"
git w HEAD~1^2
echo "*** $NOW show HEAD~1^3 :"
git w HEAD~1^3
echo "*** $NOW show HEAD~2^1 :"
git w HEAD~2^1
echo "*** $NOW show HEAD~2^2 :"
git w HEAD~2^2

# Move the branch pointer back to the previous HEAD:
# git reset --soft HEAD@{1}

# Tar (zip) "project.tar.xz" file, excluding .git directory:
# tar cJf project.tar.xz project/ --exclude-vcs

# echo "*** Cover your tracks:"
# Remove from repository all locally deleted files:
# git rm $(git ls-files --deleted)

# Commented out for cleanup at start of next run:
# cd ..
# rm -rf ${TMP}

echo "*** $NOW end."
