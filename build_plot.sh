#! /bin/bash
cd /var/www/html/ci_uploads
rm -rf plot.tsv
for d in ./bmw_wallet/*
do
 echo "Processing $d"
 for f in $d/*
 do
  echo "file: $f"
  TS=`echo $f | cut -f4 -d .`;
  echo "ts=$TS"
  while read p; do
   if [[ "$p" == *"lines covered"* ]]; then
    #echo "$p"
    VALUE=`echo $p | cut -f1 -d '%'`;
    echo "$TS   $VALUE" >> plot.tsv;
   fi
  done <$f
 done
done

gnuplot -e "set terminal svg; plot 'plot.tsv'" > bmw_wallet_cc.svg

rm -rf plot.tsv
for d in ./bitcoinmw/*
do
 echo "Processing $d"
 for f in $d/*
 do
  echo "file: $f"
  TS=`echo $f | cut -f4 -d .`;
  echo "ts=$TS"
  while read p; do
   if [[ "$p" == *"lines covered"* ]]; then
    #echo "$p"
    VALUE=`echo $p | cut -f1 -d '%'`;
    echo "$TS   $VALUE" >> plot.tsv;
   fi
  done <$f
 done
done

gnuplot -e "set terminal svg; plot 'plot.tsv'" > bitcoinmw_cc.svg
