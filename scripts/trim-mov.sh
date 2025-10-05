#!/bin/bash

# trim the mov file to the beginning and end of the video
INPUT_FILE=$1
OUTPUT_FILE=output.mov

# trim range (unit: seconds)
V1="0:7"
V2="8:16"

ffmpeg -i $INPUT_FILE -filter_complex \
    "[0:v]trim=0:7,setpts=PTS-STARTPTS[v1]; \
    [0:v]trim=8:16,setpts=PTS-STARTPTS[v2]; \
    [v1][v2]concat=n=2:v=1:a=0[v]" \
    -map "[v]" $OUTPUT_FILE
