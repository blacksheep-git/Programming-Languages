# Mateo Ortegon
# CS354 LA5 - AWK

## Purpose
This program parses the `BldgPrmtsPublic10-01-2017To10-15-2017.csv` and renders an HTML page `output.html` with all the single family dwelling listings.

## Running
Run the `run.sh` script
```shell
./run.sh
```

OR

Input the command directly.
```shell
cat BldgPrmtsPublic10-01-2017To10-15-2017.csv | awk -f parser > output.html
```
