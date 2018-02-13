#!/bin/bash

INPUT_FOLDER="../input"
OUTPUT_FOLDER="frames"
STAGES_FOLDER="stages"
NUM_STAGES=20

mkdir ./$STAGES_FOLDER

for IN in $( ls $INPUT_FOLDER ); do
	echo "$INPUT_FOLDER/$IN"
	python dream.py "$INPUT_FOLDER/$IN"
  exit 0 # just quit after the first image... gotta modify more TODO
done
