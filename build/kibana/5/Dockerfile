FROM kibana:5.1.2

MAINTAINER Bertrand Goubot <bgoubot@yahoo.fr> 

RUN chmod +x /instal_plugin.sh 
RUN /instal_plugin.sh

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

EXPOSE 5601
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["kibana"]
