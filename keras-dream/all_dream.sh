#!/bin/bash

INPUT_FOLDER="input"
OUTPUT_FOLDER="results"
STAGES_FOLDER="stages"
NUM_STAGES=20

mkdir ./$STAGES_FOLDER

for IN in $( ls $INPUT_FOLDER ); do
  BASE=$(echo $IN | rev | cut -f 2- -d '.' | rev)
  for i in `seq 1 $NUM_STAGES`; do
	  mkdir $STAGES_FOLDER/$i
  
	  if [[ $i -eq 1 ]]; then
	  	python deep_dream.py $INPUT_FOLDER/$IN $STAGES_FOLDER/$i/$BASE
	  else
		let PREV=i-1
	  	python deep_dream.py "$STAGES_FOLDER/$PREV/$BASE.png" $STAGES_FOLDER/$i/$BASE	
	  fi
  done
done

#python deep_dream.py $INPUT_FOLDER/$IN $OUTPUT_FOLDER/$BASE
