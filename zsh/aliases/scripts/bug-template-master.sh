#!/bin/bash

# AI_PROMPT="/Users/travislinkey/Documents/Obsidian/Travis/obsidian/3 - Source Material/AI Prompts/Work/AI_PROMPT_TEMPLATE.md"

DIFF_PROMPT="/Users/travislinkey/Documents/Obsidian/Travis/obsidian/3 - Source Material/AI Prompts/Work/DIFF_STANDARDS.md"

CODING_STANDARDS="/Users/travislinkey/Documents/Obsidian/Travis/obsidian/3 - Source Material/AI Prompts/Work/CODING_STANDARDS.md"

echo "Creating the diff..."

# create the diff file
git diff remotes/origin/master...HEAD > DIFF.md


echo "Creating the prompt files..."

# create the coding standards file
cp "$DIFF_PROMPT" .
cp "$CODING_STANDARDS" .

echo "Done! ✅"
