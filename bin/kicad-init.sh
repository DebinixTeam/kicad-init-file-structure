#!/bin/bash
set -e
#The MIT License (MIT)
#
#Copyright (c) 2021 Debinix Team
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.

# USAGE:

# Copy this file to '/usr/local/bin' Change the working directory
# to the root where you keep your KiCad projects. Run the script with
# first argument as the project name, e.g.
#
#   bash kicad-init 'my-new-kicad-project'.
#
# Note: No white space in the project name!


# Test if curl is installed
command -v curl
if [ $? -ne 1 ]
then
    echo "curl is not installed!"
    echo "Please install with"
    echo
    echo "sudo apt install curl"
    echo
    echo "and try again ..."  
    exit
fi

# Test if curl is installed
command -v tree
if [ $? -ne 1 ]
then
    echo "tree is not installed!"
    echo "Please install with"
    echo
    echo "sudo apt install tree"
    echo
    echo "and try again ..."  
    exit
fi


# Get user project name from the first argument
SCRIPT=$(basename "$0")
PROJECT_NAME=$1

if [ $# -ne 1 ]
then
    echo "Missing an acceptable project name ($1) after $SCRIPT"
    echo "Please try agin, and no spaces in the name -- terminating now."
    exit
fi


echo "Continues now, setting up KiCad directory structure for $PROJECT_NAME ..."


# Build a complete KiCad project hierarchy
OUTDIR_FAB="$(pwd)/$PROJECT_NAME/fabrication/gerbers"
OUTDIR_IMG="$(pwd)/$PROJECT_NAME/images"

OUTDIR_CAD1="$(pwd)/$PROJECT_NAME/kicad/$PROJECT_NAME-footprints.pretty"
OUTDIR_CAD2="$(pwd)/$PROJECT_NAME/kicad/$PROJECT_NAME-symbols"

OUTDIR_LIB1="$(pwd)/$PROJECT_NAME/libs-downloaded/footprints.pretty"
OUTDIR_LIB2="$(pwd)/$PROJECT_NAME/libs-downloaded/3d-models"
OUTDIR_LIB3="$(pwd)/$PROJECT_NAME/libs-downloaded/symbols"


# Build list of directories and build directories
ALL_DIRS="$OUTDIR_FAB $OUTDIR_IMG $OUTDIR_CAD1 $OUTDIR_CAD2 $OUTDIR_LIB1 $OUTDIR_LIB2 $OUTDIR_LIB3"

for DEST in $ALL_DIRS
do
    if [ -d "$DEST" ]; then
        echo "Ooops $DEST already exists, so skipping ..."
    else
        mkdir -p "$DEST"
        echo "Created $DEST ...."
    fi
done

# Copy .gitignore, LICENSE.md and the README.md and add these to the hierarchy
curl https://raw.githubusercontent.com/DebinixTeam/kicad-init-file-structure/master/LICENSE.md > $(pwd)/"$PROJECT_NAME"/LICENSE.md
curl https://raw.githubusercontent.com/DebinixTeam/kicad-init-file-structure/master/README.md > $(pwd)/"$PROJECT_NAME"/README.md
curl https://raw.githubusercontent.com/DebinixTeam/kicad-init-file-structure/master/.gitignore > $(pwd)/"$PROJECT_NAME"/.gitignore

echo "Copied .gitignore, README.md and the LICENSE.md files, please update these files to fit your project: $PROJECT_NAME"


# Add the four placeholder files
touch $(pwd)/"$PROJECT_NAME"/fabrication/place-holder-for-missing-bom-file
touch "$OUTDIR_FAB"/placeholder-for-missing-zip-archive
touch "$OUTDIR_IMG"/placeholder-for-missing-photographs
touch $(pwd)/"$PROJECT_NAME"/kicad/placeholder-for-missing-schematic-pdf

echo "Created four placeholder files ..."

tree -a

echo "All done -- thank you!"
