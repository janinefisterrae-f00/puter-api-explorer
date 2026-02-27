#!/bin/bash

# Configurazione automatica per Puter API Explorer

echo "🚀 Avvio configurazione Vercel per Puter API Explorer"

# Verifica dipendenze
if ! command -v vercel &> /dev/null; then
  echo "⚠️ Vercel CLI non installata. Installazione in corso..."
  npm install -g vercel
fi

# Login Vercel
echo "
🔹 Accedi al tuo account Vercel (se richiesto)"
vercel login

# Configura variabili d'ambiente
echo "
🔹 Configurazione variabili d'ambiente"
read -p "Inserisci la tua Puter API Key: " PUTER_API_KEY
vercel env add PUTER_API_KEY production <<< "$PUTER_API_KEY"

# Deploy finale
echo "
🔹 Esecuzione deploy su Vercel"
vercel --prod --yes

# Verifica integrazione
echo "
✅ Configurazione completata! Verifica l'integrazione con:"
echo "curl -X POST \$(vercel url)/api/chat -H 'Content-Type: application/json' -d '{"model":"react-pro", "prompt":"Ciao"}'"

# Informazioni utili
echo "
📌 La demo è disponibile su: $(vercel url)"
echo "🔑 La tua API Key è salvata in Vercel (non nel codice)"
echo "🔄 Ogni push su GitHub attiverà automaticamente un nuovo deploy"