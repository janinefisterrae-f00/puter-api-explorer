#!/bin/bash

# Check Node.js version
if ! command -v node &> /dev/null; then
  echo "❌ Node.js not installed. Please install Node.js 20+"
  exit 1
fi

# Check for .env file
if [ ! -f ".env" ]; then
  echo "⚠️  Creating .env file..."
  echo "PUTER_API_KEY=local_test_key" > .env
  echo "💡 Edit .env with your real API key"
fi

# Install dependencies
if [ ! -d "node_modules" ]; then
  echo "📦 Installing dependencies..."
  npm install
fi

# Start server
echo "
🚀 Starting local server at http://localhost:3000"
node server.js