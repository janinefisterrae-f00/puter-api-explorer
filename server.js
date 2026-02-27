const express = require('express');
const bodyParser = require('body-parser');
const chat = require('./api/chat');
const auth = require('./api/auth');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());
app.use(express.static('.'));

// API Routes
app.post('/api/chat', (req, res) => chat(req, res));
app.post('/api/auth', (req, res) => auth(req, res));

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'ok', api_key_set: !!process.env.PUTER_API_KEY });
});

app.listen(PORT, () => {
  console.log(`\n🚀 Puter API Explorer running locally at http://localhost:${PORT}`);
  console.log(`💡 Use PUTER_API_KEY environment variable to configure your API key`);
  console.log(`✅ Frontend available at http://localhost:${PORT}/`);
  console.log(`✅ API endpoint: http://localhost:${PORT}/api/chat`);
});