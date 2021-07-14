#! /bin/bash
cd /var/www/html/ci_uploads
rm -rf bmw_wallet.tsv
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
    echo "$TS   $VALUE" >> bmw_wallet.tsv;
   fi
  done <$f
 done
done

gnuplot -e "set terminal svg; plot 'bmw_wallet.tsv'" > bmw_wallet_cc.svg

rm -rf bitcoinmw.tsv
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
    echo "$TS   $VALUE" >> bitcoinmw.tsv;
   fi
  done <$f
 done
done

gnuplot -e "set terminal svg; plot 'bitcoinmw.tsv'" > bitcoinmw_cc.svg

rm -rf rust-tor.tsv
for d in ./rust-tor/*
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
    echo "$TS   $VALUE" >> rust-tor.tsv;
   fi
  done <$f
 done
done

gnuplot -e "set terminal svg; plot 'rust-tor.tsv'" > rust-tor_cc.svg


