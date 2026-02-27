# Puter API Explorer - Local Setup

Run the entire Puter API Explorer stack **locally with Docker**.

## 🚀 Quick Start

```bash
# 1. Clone the repository
 git clone https://github.com/janinefisterrae-f00/puter-api-explorer.git
 cd puter-api-explorer

# 2. Configure your API key
 cp .env.example .env
 nano .env  # Insert your PUTER_API_KEY

# 3. Start with convenience script
 ./start.sh
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

## 🐳 Docker Compose (Alternative)
```yaml
# docker-compose.yml
version: '3'
services:
  explorer:
    build: .
    ports:
      - "3000:3000"
    env_file:
      - .env
```

## 📌 Notes
- No GitHub OAuth needed for local testing
- All API calls go directly to Puter.com
- Data is stored in browser localStorage (no database required)
- Use `./start.sh` for simplified startup
- Press Ctrl+C to stop the container (keeps data intact)