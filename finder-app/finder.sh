#!/bin/bash
#set -o nounset
#set -o pipefail

# --- Args and validation
if [ $# -ne 2 ]; then
echo "Error: expected 2 arguments <filesdir>  <searchstr>&2"
exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
echo "Error: '$filesdir' is not a directory.">&2
exit 1
fi


# count regular files under filesdir, robust to space/permissions
X=$(find -L "$filesdir" -type f 2>/dev/null | wc -l )

#coumpute Y (matching lines)
Y=$(grep -r -F --binary-files=text -- "$searchstr" "$filesdir" 2>/dev/null | wc -l| awk '{print $1}' )

echo "The number of files are $X and the number of matching lines are $Y"
