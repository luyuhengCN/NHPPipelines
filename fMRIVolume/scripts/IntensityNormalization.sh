#!/bin/bash 
set -e
echo -e "\n START: IntensityNormalization"

#Option to apply biasfield to fMRI

InputfMRI="$1"
BiasField="$2"
Jacobian="$3"
BrainMask="$4"
OutputfMRI="$5"
ScoutInput="$6"
ScoutOutput="$7"


fslmaths "$InputfMRI" -div "$BiasField" -mul "$Jacobian" -mas "$BrainMask" -inm 10000 "$OutputfMRI" -odt float

fslmaths "$ScoutInput" -div "$BiasField" -mul "$Jacobian" -mas "$BrainMask" -inm 10000 "$ScoutOutput" -odt float

echo "END: IntensityNormalization"
