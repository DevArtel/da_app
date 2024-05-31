#!/bin/bash

set -eo pipefail

echo "💿 Install Melos"
dart pub global activate melos
echo "✅ Melos is installed"

echo "💿 Install Fluttergen"
dart pub global activate flutter_gen
echo "✅ Fluttergen is installed"

echo "💿 Install GitHub CLI"
brew install gh
echo "✅ GitHub CLI is installed"

echo "💿 Install Cocoapods"
brew install cocoapods
brew link --overwrite cocoapods
echo "✅ Cocoapods is installed"

echo "🧑‍🍳 Prepare project"
melos prepare

echo " ✧ ██████╗  █████╗      █████╗ ██████╗ ██████╗"
echo "   ██╔══██╗██╔══██╗  ✧ ██╔══██╗██╔══██╗██╔══██╗"
echo "   ██║  ██║███████║    ███████║██████╔╝██████╔╝"
echo "✧  ██║  ██║██╔══██║    ██╔══██║██╔═══╝ ██╔═══╝"
echo "   ██████╔╝██║  ██║    ██║  ██║██║  ✧  ██║"
echo "   ╚═════╝ ╚═╝  ╚═╝ ✧  ╚═╝  ╚═╝╚═╝     ╚═╝   ✨"

melos run
