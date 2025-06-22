#!/bin/bash

echo "🔁 Copying vinaswap → vinaswap_source..."
rm -rf vinaswap_source
mkdir vinaswap_source
cp -r vinaswap/* vinaswap_source/

rm -rf vinaswap_source/.git

echo "📦 Adding vinaswap_source to git"
git add vinaswap_source

echo "📝 Commit snapshot"
git commit -m "snapshot: update vinaswap source"

echo "🚀 Pushing to remote"
git push origin head
