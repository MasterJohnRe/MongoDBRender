FROM mongo:6.0

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 27017

CMD ["/start.sh"]
