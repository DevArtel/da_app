#!/bin/bash

set -eo pipefail

echo "💿 Install Task"
brew install go-task/tap/go-task
echo "✅ Task is installed"

echo "💿 Install GitHub CLI"
brew install gh
echo "✅ GitHub CLI is installed"

echo "🧑‍🍳 Prepare project"
task prepare

echo " ✧ ██████╗  █████╗      █████╗ ██████╗ ██████╗"
echo "   ██╔══██╗██╔══██╗  ✧ ██╔══██╗██╔══██╗██╔══██╗"
echo "   ██║  ██║███████║    ███████║██████╔╝██████╔╝"
echo "✧  ██║  ██║██╔══██║    ██╔══██║██╔═══╝ ██╔═══╝"
echo "   ██████╔╝██║  ██║    ██║  ██║██║  ✧  ██║"
echo "   ╚═════╝ ╚═╝  ╚═╝ ✧  ╚═╝  ╚═╝╚═╝     ╚═╝   ✨"

task --list-all
