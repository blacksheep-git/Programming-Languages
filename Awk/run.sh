#! /usr/bin/sh
cat BldgPrmtsPublic10-01-2017To10-15-2017.csv | awk -f parser > output.html
