influxd &
influx -execute 'CREATE DATABASE telegraf'
pkill influxd
influxd &
telegraf --config telegraf.conf