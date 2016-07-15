mkdir -p ./scratch/output_cep2
mkdir -p ./scratch/upload
mkdir -p ./scratch/cleaned_wcgrid_data
mkdir -p ./scratch/dupe_wcgrid_data
mkdir -p ./scratch/trash_wcgrid_data

# This just tests that calling the command works.
# a better test would be to copy in some fake data and sort it

docker-compose -f docker-compose.yml \
    -f docker-compose.test.yml \
    run \
    -e "DJANGO_COMMAND=cleanwcgbatch $$completed_md5 --wus=$$upload --sorted_md5=$$processed_md5 --sorted_path=$$clean --dupes_path=$$dupes --trash_path=$$trash" \
    wcgrid_handler 

rm -r ./scratch