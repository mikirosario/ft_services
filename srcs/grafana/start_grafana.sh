mv /tmp/telegraf.conf /telegraf.conf
mv /tmp/custom.ini /grafana-7.3.6/conf/custom.ini
mv /tmp/key.pem /grafana-7.3.6/key.pem
mv /tmp/cert.pem /grafana-7.3.6/cert.pem
telegraf --config telegraf.conf &
cd ./grafana-7.3.6/bin/ && ./grafana-server