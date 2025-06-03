FROM mongo:6.0

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
