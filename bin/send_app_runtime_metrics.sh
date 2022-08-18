SERVER_IP="10.128.0.10"
FOLDER_ID="b1gflnr5b5jbem756kos"
IAM_TOKEN=`/home/admin/yandex-cloud/bin/yc iam create-token`

RUNTIME=`curl -v "${SERVER_IP}" 2>&1 1>/dev/null | grep Runtime | cut -d " " -f 3`
if [ -z $RUNTIME ]; then RUNTIME=0; fi

curl -X POST \
   -H "Content-Type: application/json" \
   -H "Authorization: Bearer ${IAM_TOKEN}" \
   -d "{\"metrics\": [{\"name\": \"app_runtime\", \"labels\": {\"vm\": \"${SERVER_IP}\"}, \"type\": \"DGAUGE\", \"value\": ${RUNTIME}}]}" \
   "https://monitoring.api.cloud.yandex.net/monitoring/v2/data/write?folderId=${FOLDER_ID}&service=custom"
