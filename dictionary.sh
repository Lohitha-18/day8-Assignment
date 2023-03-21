#!/bin/bash

declare -A rolls
rolls[1]=0
rolls[2]=0
rolls[3]=0
rolls[4]=0
rolls[5]=0
rolls[6]=0

while true; do
  # Roll the die
  roll=$(( RANDOM % 6 + 1 ))

  rolls[$roll]=$(( ${rolls[$roll]} + 1 ))

  for key in "${!rolls[@]}"; do
    if [[ ${rolls[$key]} -ge 10 ]]; then
      echo "Number $key has reached 10 times."
      break 2 # Break out of both loops
    fi
  done
done

max=0
min=10
for key in "${!rolls[@]}"; do
  if [[ ${rolls[$key]} -gt $max ]]; then
    max=${rolls[$key]}
    max_num=$key
  fi
  if [[ ${rolls[$key]} -lt $min ]]; then
    min=${rolls[$key]}
    min_num=$key
  fi
done

echo "Number $max_num reached maximum times ($max)."
echo "Number $min_num reached minimum times ($min)."
