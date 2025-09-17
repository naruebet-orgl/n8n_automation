FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Set environment variables
ENV DB_TYPE=postgresdb
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_PERSONALIZATION_ENABLED=false
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Copy demo data
COPY --chown=node:node ./n8n/demo-data /demo-data
COPY --chown=node:node ./shared /data/shared

# Create necessary directories with proper permissions
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node

# Expose port
EXPOSE 5678

# Start n8n with proper path
CMD ["/usr/local/bin/n8n", "start"]