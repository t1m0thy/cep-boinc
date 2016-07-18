docker-compose -f docker-compose.yml \
    -f docker-compose.test.yml \
    run \
    -e "DJANGO_COMMAND=migrate" \
    wcgrid_handler

docker-compose -f docker-compose.yml \
    -f docker-compose.test.yml \
    run \
    -e "DJANGO_COMMAND=loaddata XQGVJSGVGSDDGA-UHFFFAOYSA-N" \
    wcgrid_handler

docker-compose -f docker-compose.yml \
    -f docker-compose.test.yml \
    run \
    -e "DJANGO_COMMAND=scanconfigs ../chemconfigs/wcgrid -u" \
    wcgrid_handler

docker-compose -f docker-compose.yml \
    -f docker-compose.test.yml \
    run \
    -e "DJANGO_COMMAND=requestjobs test wcgrid" \
    wcgrid_handler


docker-compose -f docker-compose.yml \
    -f docker-compose.test.yml \
    run \
    -e "DJANGO_COMMAND=requestjobs test wcgrid" \
    wcgrid_handler


docker-compose -f docker-compose.yml \
    -f docker-compose.test.yml \
    run \
    -e "DJANGO_COMMAND=parsewcgbatch /root/a2g2/djangochem/wcgrid/test_data" \
    wcgrid_handler 
