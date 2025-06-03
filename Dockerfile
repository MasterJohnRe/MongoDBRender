FROM mongo:6.0

# Install Python3 for dummy HTTP server
RUN apt-get update && apt-get install -y python3 && apt-get clean

# Copy and make the startup script executable
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose MongoDB + dummy HTTP port (Render needs 10000+)
EXPOSE 27017 10000

CMD ["/start.sh"]
