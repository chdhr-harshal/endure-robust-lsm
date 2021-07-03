#!/bin/bash

for f in `ls *.pdf` 
do
    echo Cropping $f ...
    pdfcrop ${f} ${f}

done
