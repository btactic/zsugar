#!/bin/bash

set -x
set -v

# $1: To find
# $2: To replace

find_and_replace () {
  find_string="$1"
  find_replace="$2"

  find . -type f -not -name $(basename ${0}) -a -not -iwholename '*.git*'  -print0 | xargs -0 sed -i 's/'"${find_string}"'/'"${find_replace}"'/g'

}

find_and_replace "com_irontec_zsugarH" "com_btactic_bsugarH"

for nfile in com_irontec_zsugar* ; do

  btactic_file=$(echo $nfile | sed 's/com_irontec_zsugar/com_btactic_bsugar/g')
  mv "${nfile}" "${btactic_file}"

done


