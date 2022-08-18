SERVER_IP="10.128.0.10"
FOLDER_ID="b1gflnr5b5jbem756kos"
IAM_TOKEN=`/home/admin/yandex-cloud/bin/yc iam create-token`
MEMORY_TOTAL=`free | grep Mem | sed 's/ \{1,\}/ /g' | cut -d " " -f 2`
MEMORY_USED=`free | grep Mem | sed 's/ \{1,\}/ /g' | cut -d " " -f 3`
MEMORY_USED_METRICS=`echo "scale=2;(($MEMORY_USED/$MEMORY_TOTAL)*100)" | bc`

curl -X POST \
   -H "Content-Type: application/json" \
   -H "Authorization: Bearer ${IAM_TOKEN}" \
   -d "{\"metrics\": [{\"name\": \"memory_usage\", \"labels\": {\"vm\": \"${SERVER_IP}\"}, \"type\": \"DGAUGE\", \"value\": ${MEMORY_USED_METRICS}}]}" \
   "https://monitoring.api.cloud.yandex.net/monitoring/v2/data/write?folderId=${FOLDER_ID}&service=custom"
