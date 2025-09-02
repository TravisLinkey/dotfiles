#!/bin/bash

echo "Installing dependencies..."
bun i 

echo "Copy env file for docket-backend..."
cp ~/Projects/ServiceCore/Docket-Platform/docket-platform/apps/docket-backend/.env ./apps/docket-backend 

echo "Copy env file for docket-api..."
cp ~/Projects/ServiceCore/Docket-Platform/docket-platform/apps/docket-api/.env ./apps/docket-api

