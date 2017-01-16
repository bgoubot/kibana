FROM kibana:5.1.2

MAINTAINER Bertrand Goubot <bgoubot@yahoo.fr> 

RUN gosu kibana cd /usr/share/kibana/plugins
RUN gosu kibana git clone https://github.com/bgoubot/kbn_c3js_vis.git c3_charts
RUN gosu kibana cd c3_charts
RUN gosu kibana npm install

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

EXPOSE 5601
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["kibana"]
