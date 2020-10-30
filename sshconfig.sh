openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem << EOF
123456789
ES
Madrid
Madrid
42
Cluster 1
MiKey
mrosario@student.42madrid.com
EOF