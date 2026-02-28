#!/bin/bash


# copy the necessary env files
echo "Copying the .env files..."
cp .env.local.dist .env.local

cd functions/
cp .env.local.dist .env.local

# delete the local secrets
echo "Deleting the local secrets..."
rm .secret.local


echo "✅ Done!"
