packed this guide into a docker image:
https://blog.butenostfreesen.de/2018/10/11/Fritz-Box-Monitoring-mit-Grafana-und-Raspberry/

# config
edit 'conf/collectd.conf' and set your fritz box's hostname and credentials

# build
```
docker build . --tag fb-grafana
```

# run
```
docker run -d --name fb-grafana \
        -p 3000:3000 \
        -v $(pwd)/conf/collectd.conf:/etc/collectd/collectd.conf.d/collectd.conf \
        -v $(pwd)/conf/influxdb.conf:/etc/influxdb/influxdb.conf \
        -v $(pwd)/conf/grafana-datasource-influxdb.yaml:/etc/grafana/provisioning/datasources/grafana-datasource-influxdb.yaml \
        -v $(pwd)/conf/grafana-dashboard-fb-status.yaml:/etc/grafana/provisioning/dashboards/grafana-dashboard-fb-status.yaml \
        -v $(pwd)/conf/grafana-dashboard-fb-status.json:/etc/grafana/provisioning/dashboards/fb-status/grafana-dashboard-fb-status.json \
        fb-grafana
```