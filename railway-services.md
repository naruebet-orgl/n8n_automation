# Railway Deployment Guide

Since Railway doesn't support Docker Compose directly, you'll need to create separate services:

## Services to Create on Railway:

### 1. PostgreSQL Database
- Use Railway's PostgreSQL template
- Note the connection details for n8n configuration

### 2. n8n Service (Main Application)
- Deploy this repository
- Set environment variables:
  - `DB_TYPE=postgresdb`
  - `DB_POSTGRESDB_HOST=[postgres service host]`
  - `DB_POSTGRESDB_USER=[postgres user]`
  - `DB_POSTGRESDB_PASSWORD=[postgres password]`
  - `DB_POSTGRESDB_DB=[postgres database name]`
  - `N8N_ENCRYPTION_KEY=[generate random key]`
  - `N8N_USER_MANAGEMENT_JWT_SECRET=[generate random key]`

### 3. Qdrant Vector Database (Optional)
- Use Railway's Redis template or deploy Qdrant manually
- Set `QDRANT_URL` environment variable

## Limitations on Railway:
- Ollama (local LLM) won't work as it requires GPU/significant CPU
- You'll need to use cloud LLM providers (OpenAI, Anthropic, etc.)
- Vector storage can use Railway's built-in solutions

## Deployment Steps:
1. Create PostgreSQL service first
2. Deploy this repository as the main n8n service
3. Configure environment variables
4. Set up domain and access n8n interface