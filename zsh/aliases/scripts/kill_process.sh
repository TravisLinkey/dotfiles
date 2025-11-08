#!/bin/bash

echo "Killing process on port $1"
kill -9 $(lsof -ti:$1)