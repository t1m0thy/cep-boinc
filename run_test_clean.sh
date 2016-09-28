#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/wcgrid_handler_utils.sh

mkdir -p ./scratch/output_cep2
mkdir -p ./scratch/upload
mkdir -p ./scratch/cleaned_wcgrid_data
mkdir -p ./scratch/dupe_wcgrid_data
mkdir -p ./scratch/trash_wcgrid_data

# This just tests that calling the command works.
# a better test would be to copy in some fake data and sort it

run_wcgrid_handler "test" "cleanwcgbatch \
  $$completed_md5 \
  --wus=$$upload \
  --sorted_md5=$$processed_md5 \
  --sorted_path=$$clean \
  --dupes_path=$$dupes \
  --trash_path=$$trash"

rm -r ./scratch
