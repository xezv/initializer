#!/usr/bin/env bash

echo "main1's pwd: $(pwd)"
echo "main1's PWD: ${PWD}"
echo "main1's dir: $(dirname "${BASH_SOURCE[0]}")"

./dir1/s1.sh
source ./dir1/s1.sh
source ./dir1/dir2/sub2.sh
