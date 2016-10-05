#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/wcgrid_handler_utils.sh

run_wcgrid_handler "test" "migrate"
run_wcgrid_handler "test" "migrate"
run_wcgrid_handler "test" "loaddata XQGVJSGVGSDDGA-UHFFFAOYSA-N"
run_wcgrid_handler "test" "scanconfigs ../chemconfigs/wcgrid -u"
run_wcgrid_handler "test" "requestjobs test wcgrid"
run_wcgrid_handler "test" "parsewcgbatch /root/a2g2/djangochem/wcgrid/test_data"
