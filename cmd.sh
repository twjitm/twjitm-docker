#!/usr/bin/env bash
pid=$(cat maintainer.pid)
docker exec -ti $pid /bin/bash