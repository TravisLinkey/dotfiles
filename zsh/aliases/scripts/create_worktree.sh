#!/bin/bash

FULL_BRANCH=$1

echo "Creating worktree for $FULL_BRANCH"

if [[ $# -ge 1 && -n "$1" ]]; then
  echo "Argument provided: $1"
else
  echo "No valid argument"
  exit 1
fi

IFS="/" read -r BRANCH_TYPE BRANCH_NAME <<< "$FULL_BRANCH"

echo "Type: $BRANCH_TYPE"
echo "Name: $BRANCH_NAME"

# get up to date with master
echo "Pulling master..."
git pull

# create the branch
echo "Creating branch..."
git branch $FULL_BRANCH

# create worktree
echo "Creating worktree - $FULL_BRANCH..."
git worktree add "../$BRANCH_NAME" $FULL_BRANCH

echo "✅ Done!"
