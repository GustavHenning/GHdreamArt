#!/bin/bash

INPUT_FOLDER="../input"
OUTPUT_FOLDER="results"
STAGES_FOLDER="stages"
NUM_STAGES=20

mkdir ./$STAGES_FOLDER
PREV=01
for IN in $( ls $INPUT_FOLDER ); do
  BASE=$(echo $IN | rev | cut -f 2- -d '.' | rev)
  for i in $(seq -w 01 $NUM_STAGES); do
	  if [ "$i" == "01" ]; then
	  	python deep_dream.py $INPUT_FOLDER/$IN "$STAGES_FOLDER/$BASE-$i"
      PREV=$i
	  else
	  	python deep_dream.py "$STAGES_FOLDER/$BASE-$PREV.png" "$STAGES_FOLDER/$BASE-$i"
      PREV=$i
	  fi
  done
done

#python deep_dream.py $INPUT_FOLDER/$IN $OUTPUT_FOLDER/$BASE
