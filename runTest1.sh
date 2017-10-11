#!/bin/bash

# install required packages
apt-get update -y && apt-get install -y --no-install-recommends wget ca-certificates

# prepare test input files
mkdir /tmp/testfiles
wget -O /tmp/testfiles/test_case_candidates.csv https://github.com/phnmnl/container-passatutto/raw/develop/testfiles/test_case_metfrag.csv

# perform test
/usr/local/bin/metfragPEP.r input=/tmp/testfiles/test_case_candidates.csv score=FragmenterScore output=/tmp/testfiles/output.txt

# check output
if [ ! -f /tmp/testfiles/output.txt ]; then 
   echo "Error: Output file /tmp/testfiles/output.txt not found"
   exit 1 
fi
