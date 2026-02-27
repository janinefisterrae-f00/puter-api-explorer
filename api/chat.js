const puter = require('@heyputer/puter.js');

module.exports = async (req, res) => {
  const { model, prompt } = req.body;
  const apiKey = process.env.PUTER_API_KEY;

  if (!apiKey) {
    return res.status(500).json({ error: 'Server configuration error' });
  }

  try {
    puter.init({ apiKey });
    const response = await puter.ai.chat({ model, prompt });
    res.status(200).json({ response });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};