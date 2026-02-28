#!/bin/bash

# Git Config Switcher Script
# Usage: ./git-switch.sh [personal|work]

case "$1" in
    "personal")
        echo "Switching to personal Git config..."
        git config user.email "tlinkey0818@gmail.com"
        git config user.name "Travis Linkey"
        echo "✅ Switched to personal config (tlinkey0818@gmail.com)"
        ;;
    "liftskit")
        echo "Switching to personal Git config..."
        git config user.email "liftskit@gmail.com"
        git config user.name "Travis Linkey"
        echo "✅ Switched to personal config (liftskit@gmail.com)"
        ;;
    *)
        echo "Current Git config:"
        echo "Name: $(git config user.name)"
        echo "Email: $(git config user.email)"
        echo ""
        echo "Usage: $0 [personal|liftskit]"
        echo "  personal - Switch to personal config (tlinkey0818@gmail.com)"
        echo "  liftskit - Switch to liftskit config (liftskit@gmail.com)"
        ;;
esac
