---
description: Initialize a worktree for a feature branch
agent: build
---

# create the worktree

Create a worktree on from the current branch using the following bash command:
`git worktree add -b $1/$2 ../$2`


create the context file in the worktree
mkdir ../$2/CONTEXT

create the context files by running:
`cp -r ~/Documents/Obsidian/Travis/obsidian/3 - Source Material/AI Prompts/Work/OpenCode/ ../$2/CONTEXT`
