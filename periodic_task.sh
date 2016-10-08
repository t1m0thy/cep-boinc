#!/bin/bash

# period_task.sh
# designed to be called by cron on the host 

# WARNING: this script uses production settings!

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/wcgrid_handler_utils.sh

# clean and sort the uploads data
run_wcgrid_handler "prod" \
  "cleanwcgbatch $$completed_md5 \
  --wus=$$upload \
  --sorted_md5=$$processed_md5 \
  --sorted_path=$$clean \
  --dupes_path=$$dupes \
  --trash_path=$$trash"

run_wcgrid_handler "prod" "parsewcgbatch $$clean"

# now cold store everything
rsync -av --remove-source-files /var/local/cleaned_wcgrid_data /n/aagfs01/cep/wu_batches/
rsync -av --remove-source-files /var/local/processed_md5 /n/aagfs01/cep/processed_md5/


# clean up the unfinished and corrupt work units
rm -r /var/local/trash_wcgrid_data/*
