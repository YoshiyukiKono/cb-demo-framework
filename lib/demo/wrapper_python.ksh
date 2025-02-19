#!/bin/ksh

# Get script
script=${1}
shift

# Get args
args=""
for i in $@;do
	args="$args $i"
done

# Record old directory and cd to script directory (KSH does not support pushd/popd)
OLDDIR=`pwd`

SCRIPTDIR=$(dirname "$script")
SCRIPTNAME=$(basename "$script")

cd $SCRIPTDIR

# Execute the script
if [ -f ${SCRIPTNAME} ];then
	python $SCRIPTNAME $args
else
	echo "Unable to find script [$SCRIPTNAME]"
fi

# Return to original directory
cd $OLDDIR
