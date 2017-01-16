FROM kibana:5.1.2

MAINTAINER Bertrand Goubot <bgoubot@yahoo.fr> 

COPY instal-plugin.sh /
RUN chmod +x /instal-plugin.sh 
RUN /instal-plugin.sh

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

EXPOSE 5601
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["kibana"]
