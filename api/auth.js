const fetch = require('node-fetch');
const { createPublicKey, sign } = require('crypto');

module.exports = async (req, res) => {
  try {
    const { code, apiKey } = req.body;

    // Exchange GitHub OAuth code for access token
    const tokenResponse = await fetch('https://github.com/login/oauth/access_token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        client_id: process.env.GITHUB_CLIENT_ID,
        client_secret: process.env.GITHUB_CLIENT_SECRET,
        code
      })
    });

    const tokenData = await tokenResponse.text();
    const params = new URLSearchParams(tokenData);
    const accessToken = params.get('access_token');

    if (!accessToken) {
      throw new Error('GitHub authentication failed');
    }

    // Get repository public key for encryption
    const publicKeyResponse = await fetch(
      'https://api.github.com/repos/janinefisterrae-f00/puter-api-explorer/actions/secrets/public-key',
      {
        headers: { 'Authorization': `Bearer ${accessToken}` }
      }
    );

    const { key_id, key } = await publicKeyResponse.json();

    // Encrypt the API key using GitHub's public key
    const messageBytes = Buffer.from(apiKey);
    const keyBytes = Buffer.from(key, 'base64');
    
    // Simplified encryption (real implementation requires libsodium)
    // In production, use '@octokit/auth' or proper encryption
    const encryptedBytes = messageBytes; // Placeholder for actual encryption
    const encryptedValue = encryptedBytes.toString('base64');

    // Save as GitHub Secret
    const saveResponse = await fetch(
      'https://api.github.com/repos/janinefisterrae-f00/puter-api-explorer/actions/secrets/PUTER_API_KEY',
      {
        method: 'PUT',
        headers: {
          'Authorization': `Bearer ${accessToken}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          encrypted_value: encryptedValue,
          key_id
        })
      }
    );

    if (saveResponse.ok) {
      res.status(200).json({ success: true });
    } else {
      throw new Error('Failed to save secret');
    }
  } catch (error) {
    res.status(500).json({ 
      success: false, 
      error: error.message 
    });
  }
};