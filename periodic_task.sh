# period_task.sh
# designed to be called by cron on the host 

# WARNING: this script uses production settings!

# clean and sort the uploads data
docker-compose -f docker-compose.yml \
    -f docker-compose.prod.yml \
    run \
    -e "DJANGO_COMMAND=cleanwcgbatch $$completed_md5 --wus=$$upload --sorted_md5=$$processed_md5 --sorted_path=$$clean --dupes_path=$$dupes --trash_path=$$trash" \
    wcgrid_handler 

# parse the data
docker-compose -f docker-compose.yml \
    -f docker-compose.prod.yml \
    run \
    -e "DJANGO_COMMAND=parsewcgbatch $$clean" \
    wcgrid_handler 


# now cold store everything
rsync -av --remove-source-files /var/cleaned_wcgrid_data /n/aagfs01/cep/wu_batches/

# clean up the unfinished and corrupt work units
rm -r /var/local/trash_wcgrid_data/*