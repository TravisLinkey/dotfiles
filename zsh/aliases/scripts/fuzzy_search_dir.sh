#!/bin/bash

local query="${1:-}"
local dir
dir=$(fd -t d . ~/Projects \
        | fzf --query "$query" --select-1 --exit-0 --prompt="Projects> ")
  [ -n "$dir" ] && cd "$dir"
