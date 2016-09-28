#!/bin/bash

function run_wcgrid_handler {
  local run_env=$1
  local django_cmd=$2
  docker-compose \
    -f docker-compose.yml \
    -f docker-compose.$run_env.yml \
    -f docker-compose.wcgrid_handler.yml \
    run \
    --rm \
    -e "DJANGO_COMMAND=$django_cmd" \
    wcgrid_handler
} 
