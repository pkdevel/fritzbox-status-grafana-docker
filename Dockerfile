FROM grafana/grafana:latest

USER root
RUN apt-get update

# collectd
# VOLUME [ "/etc/collectd/collectd.conf.d/" ]
RUN mkdir -p /usr/share/man/man1 && apt-get install -y python-pip collectd
RUN pip install fritzcollectd

# VOLUME [ "/etc/influxdb/influxdb.conf" ]
RUN curl -sL https://repos.influxdata.com/influxdb.key | apt-key add -
RUN echo "deb https://repos.influxdata.com/debian stretch stable" | tee /etc/apt/sources.list.d/influxdb.list
RUN apt-get install influxdb

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["sh", "-c", "/etc/init.d/collectd start && /etc/init.d/influxdb start && /run.sh"]
