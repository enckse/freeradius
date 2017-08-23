#!/bin/bash
TMPDB=dump.db
case $1 in
    "report" | "optimize")
        rm -f $5
        reporting="--report $2 --output $3"
        if [ $1 == "optimize" ]; then
            reporting="--optimize"
        fi
        python report.py --database $TMPDB $reporting | tail -n +$4 >> $5
        ;;
    "store")
        rm -f $TMPDB
        cat $2 | python store.py
        ;;
esac
