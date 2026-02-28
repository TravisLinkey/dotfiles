#!/bin/bash

echo "Installing dependencies..."
bun i 

echo "Copy env file for docket-backend..."
cp ~/Projects/ServiceCore/workspace/Docket-Platform/docket-platform/apps/docket-backend/.env.dist ./apps/docket-backend/.env

echo "Copy env file for docket-api..."
cp ~/Projects/ServiceCore/workspace/Docket-Platform/docket-platform/apps/docket-api/.env.dist ./apps/docket-api/.env

echo "Copy docket-stage.json..."
cp ~/Projects/ServiceCore/workspace/Docket-Platform/docket-platform/docket-stage.json .

echo "✅ Done!"
