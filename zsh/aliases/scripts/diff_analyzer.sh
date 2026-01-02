#!/bin/bash

FULL_BRANCH=$1

bash ~/Projects/bash/workspace/git-diff-analyzer/bin/git-diff-review.sh $FULL_BRANCH

delimiter="/"

BRANCH_NAME=$(echo $FULL_BRANCH | cut -d "$delimiter" -f 2)

echo "Changing directory into: $BRANCH_NAME"

cursor .
