docker-compose \
    -f docker-compose.yml \
    -f docker-compose.test.yml \
    run \
    -e "DJANGO_COMMAND=test" \
    wcgrid_handler