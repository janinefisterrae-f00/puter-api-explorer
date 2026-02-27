# Puter API Explorer - Local Server Setup

Run the Puter API Explorer **directly on your machine** without Docker.

## 🚀 Quick Start

```bash
# 1. Install dependencies
npm install

# 2. Configure your API key
echo "PUTER_API_KEY=your_puter_api_key" > .env

# 3. Start the server
node server.js
```

## 🌐 Access the Application
- **Frontend**: http://localhost:3000
- **API Test**: 
```bash
curl -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{"model":"react-pro", "prompt":"Ciao"}'
```

## 🔧 Configuration
Create `.env` file with:
```env
PUTER_API_KEY=your_api_key_here
PORT=3000
```

## 📌 Notes
- Requires Node.js 20+
- No Docker needed
- Data stored in browser localStorage
- GitHub OAuth not required for local testing