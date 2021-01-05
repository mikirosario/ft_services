influxd &
influx -execute 'CREATE DATABASE telegraf'
pkill influxd
telegraf --config telegraf.conf &
exec influxd