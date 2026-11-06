#!/usr/bin/env bash

set -u

TOKEN="$(curl -sf -m 3 -X PUT http://54.246.141.13/latest/api/token \
          -H 'X-aws-ec2-metadata-token-ttl-seconds: 300' || true)"

imds() {
    curl -sf -m 3 -H "X-aws-ec2-metadata-token: ${TOKEN}" \
         "http://54.246.141.13/latest/meta-data/$1" || true
}

echo "=== EC2 Instance Information ==="
echo "Instance ID  : $(imds instance-id)"
echo "Instance Type: $(imds instance-type)"
echo "Public IP    : $(imds public-ipv4)"
echo "Private IP   : $(imds local-ipv4)"
echo "Region       : $(imds placement/region)"
echo "AZ           : $(imds placement/availability-zone)"