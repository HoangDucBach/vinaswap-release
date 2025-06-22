#!/bin/bash

set -e

echo "📥 Updating submodules..."
git submodule update --init --recursive

echo "🔄 Pulling latest code from vinaswap..."
cd vinaswap
git checkout main
git pull origin main
cd ..

echo "🔁 Copying to vinaswap_source..."
rm -rf vinaswap_source
mkdir vinaswap_source
cp -r vinaswap/* vinaswap_source/
rm -rf vinaswap_source/.git

git add vinaswap_source
git commit -m "snapshot: update vinaswap source"
git push
