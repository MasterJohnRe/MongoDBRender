FROM mongo:6.0

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 27017 10000

CMD ["/start.sh"]
