#!/bin/bash

# Check for .env file
if [ ! -f ".env" ]; then
  echo "⚠️  Creating .env file from example..."
  cp .env.example .env
  echo "💡 Please edit .env with your API key and run again"
  exit 1
fi

# Build and run
echo "🚀 Building Docker image..."
docker build -t puter-explorer . --no-cache

echo "🐳 Running container..."
docker run -p 3000:3000 \
  --env-file .env \
  --name puter-explorer \
  -d \
  puter-explorer

# Show logs
echo "
📋 Container logs (Ctrl+C to exit):
"
docker logs -f puter-explorer