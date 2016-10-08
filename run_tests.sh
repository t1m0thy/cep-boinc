#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/wcgrid_handler_utils.sh

run_wcgrid_handler "test" "test"
