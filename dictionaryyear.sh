#!/bin/bash

months=$(shuf -i 1-12 -n 50)

birthdates=()

for month in $months
do
  year=$(shuf -i 1992-1993 -n 1)
  day=$(shuf -i 1-28 -n 1)  # Assume all months have 28 days
  birthdate="$year-$(printf %02d $month)-$(printf %02d $day)"
  birthdates+=($birthdate)
done

declare -A birth_month

for date in "${birthdates[@]}"
do
  month=$(date -d "$date" +%B)
  if [ -z "${birth_month[$month]}" ]
  then
    birth_month[$month]="$date"
  else
    birth_month[$month]+=", $date"
  fi
done

for month in "${!birth_month[@]}"
do
  echo "$month: ${birth_month[$month]}"
done
