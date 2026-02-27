# Puter API Explorer - Local Setup

Run the entire Puter API Explorer stack **locally with Docker**.

## 🚀 Quick Start

```bash
# 1. Build the Docker image
docker build -t puter-explorer .

# 2. Run with your Puter API key
docker run -p 3000:3000 \
  -e PUTER_API_KEY=your_puter_api_key \
  puter-explorer
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
| Variable | Required | Description |
|----------|----------|-------------|
| `PUTER_API_KEY` | ✅ | Your [Puter API key](https://app.puter.com/account/api) |
| `PORT` | ❌ | Server port (default: 3000) |

## 🐳 Docker Compose (Optional)
```yaml
# docker-compose.yml
version: '3'
services:
  explorer:
    build: .
    ports:
      - "3000:3000"
    environment:
      - PUTER_API_KEY=your_api_key
```

## 📌 Notes
- No GitHub OAuth needed for local testing
- All API calls go directly to Puter.com
- Data is stored in browser localStorage (no database required)