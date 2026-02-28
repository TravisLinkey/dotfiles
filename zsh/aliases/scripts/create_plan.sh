#!/bin/bash

PLAN_FILE="$HOME/Documents/Obsidian/Travis/obsidian/3 - Source Material/AI Prompts/Work/00__PLAN_FILE.txt"

CODING_STANDARDS="$HOME/Documents/Obsidian/Travis/obsidian/3 - Source Material/AI Prompts/Work/01__CODING_STANDARDS.txt"

TESTING_STANDARDS="$HOME/Documents/Obsidian/Travis/obsidian/3 - Source Material/AI Prompts/Work/Testing/02__TESTING_STANDARDS.txt"

mkdir -p CONTEXT

cp "$PLAN_FILE" ./CONTEXT
cp "$CODING_STANDARDS" ./CONTEXT
cp "$TESTING_STANDARDS" ./CONTEXT

cd ./CONTEXT
mv 00__PLAN_FILE.txt 00__PLAN_FILE.md
mv 01__CODING_STANDARDS.txt 01__CODING_STANDARDS.md
mv 02__TESTING_STANDARDS.txt 02__TESTING_STANDARDS.md

