#!/bin/bash
# Creates boilerplate for React Component

DIR=$(command pwd -P)
EXT='.js'
NAME='test'

for i in "$@"
do
	case $i in
	    -d=*|--dir=*)
	    DIR="${i#*=}"

	    ;;
	    -n=*|--name=*)
	    NAME="${i#*=}"
	    ;;
	    -e=*|--ext=*)
	    EXT="${i#*=}"
	    ;;
	    --default)
	    DEFAULT=YES
	    ;;
	    *)
	            # unknown option
	    ;;
	esac
done

echo DIR = $DIR
echo NAME = $NAME
echo EXT = $EXT

if [ -d "$DIR" ]; then
  # Control will enter here if $DIRECTORY exists.
  cd $DIR
else
	mkdir $DIR
	cd $DIR
	echo "Created new directory"
fi

FILENAME="$NAME.$EXT"
echo $FILENAME
if [ ! -e $FILENAME ]; then
	rm $FILENAME
fi
touch $FILENAME

echo "import React from 'react';" >> $FILENAME
echo "" >> $FILENAME
echo "class $NAME extends React.Component {" >> $FILENAME
echo "	constructor(props){" >> $FILENAME
echo "		super(props);" >> $FILENAME
echo "  }" >> $FILENAME
echo "  render() {" >> $FILENAME
echo "    return (" >> $FILENAME
echo "		<div>Hello $NAME</div>" >> $FILENAME
echo "    );" >> $FILENAME
echo "  }" >> $FILENAME
echo "}" >> $FILENAME
echo "" >> $FILENAME
echo "export default $NAME;" >> $FILENAME
