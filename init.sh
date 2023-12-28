#!/bin/bash

set -eo pipefail

echo "💿 Install FVM"
brew tap leoafarias/fvm
brew install fvm
echo "✅ FVM is installed"

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