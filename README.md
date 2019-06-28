# build
```
docker build . --tag fb-status
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