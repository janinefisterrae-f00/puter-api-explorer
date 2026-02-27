#!/bin/bash

# Check for .env file
if [ ! -f ".env" ]; then
  echo "⚠️  Creating .env file from example..."
  cp .env.example .env
  echo "💡 Please edit .env with your API key and run again"
  exit 1
fi

# Clean up existing container
if [ $(docker ps -aq -f name=puter-explorer) ]; then
  echo "🧹 Removing existing container..."
  docker rm -f puter-explorer > /dev/null
fi

# Build and run
echo "🚀 Building Docker image..."
docker build -t puter-explorer . --no-cache

echo "🐳 Running container in background..."
docker run -p 3000:3000 \
  --env-file .env \
  --name puter-explorer \
  -d \
  puter-explorer

echo "\n✅ Server started at http://localhost:3000"
echo "💡 Check logs with: docker logs -f puter-explorer"
echo "💡 Stop with: docker stop puter-explorer"