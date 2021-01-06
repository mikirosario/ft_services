influxd &
#influx -execute 'CREATE DATABASE telegraf'
influxd restore -portable /influxdb_backup/
pkill influxd
telegraf --config telegraf.conf &
exec influxd