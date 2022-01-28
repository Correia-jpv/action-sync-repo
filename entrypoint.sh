#!/bin/bash

set -e

if [ -z "$SECRET_TOKEN" ]; then
    echo "Set SECRET_TOKEN environment variable"
    exit 1
fi

/sync_repo.sh "$@"
