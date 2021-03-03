#!/bin/bash

#DataMining/code-and-scipts/basic-arff-to-pat.sh

#Convert the file weather.numeric.arff to javanns .pat format.

#INFILE="/KDrive/SEH/SCSIT/Students/Courses/COSC2111/DataMining/data/arff/UCI/weather.numeric.arff"
#INFILE="/HDrive/DM/Ass2/weather.numeric.arff"
INFILE="/home/sh2/S3400652/HDrive/DM/Ass2/hypothyroid_train.arff"


###Insert the header of the pat file
### JavaNNS is very very fussy about the header.
/bin/echo "SNNS pattern definition file V3.2"  >hypothyroid_train.pat
/bin/echo "generated at Tue Sep 24 12:59:23 2020"  >>hypothyroid_train.pat
/bin/echo ""  >>hypothyroid_train.pat
/bin/echo "No. of patterns : 725"  >>hypothyroid_train.pat
/bin/echo "No. of input units : 34"  >>hypothyroid_train.pat
/bin/echo "No. of output units : 4"  >>hypothyroid_train.pat
/bin/echo ""  >>hypothyroid_train.pat


#write outthe input file
cat $INFILE

##To find the number of patterns
#find the line number for @data
cat -n $INFILE | fgrep @data

#count the number of patterns
tail -n +10 $INFILE | wc -l

#Now generate the inputs and outputs
tail -n +10 $INFILE |\
  #sed -e"s/sunny/1 0 0/" |\
  sed -e"s/rainy/0 1 0/" |\
  sed -e"s/overcast/0 0 1/" |\
  sed -e"s/FALSE/1 0/" |\
  sed -e"s/TRUE/0 1/" |\
  sed -e"s/yes/1 0/" |\
  sed -e"s/no/0 1/" |\
# Convert commas to spaces
  tr "," " " |\
  cat >>hypothyroid_train.pat