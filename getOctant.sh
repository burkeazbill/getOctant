#!/bin/bash
# Author: Burke Azbill
# Script Name: getOctant.sh
# Purpose: Retrieve the current version of Octant for MacOS/Linux environments
# Date: Aug 13, 2019
# Set Variables:
OS="`uname -s`"
FILE_EXT="tar.gz"

# Detect the platform and reset OS for URL generation
case $OS in
  'Linux')  OS='Linux'  ;;
  'Darwin') OS='macOS'    ;;
  *) ;;
esac

# Check for Command Line Parameters:
if [ ${#} -gt 0 ]; then
  if [ "$OS" == "Linux" ]; then
    case $1 in
      '?') echo "Usage: getOctant.sh ext"; echo "  getOctant.sh rpm"; echo "  Valid ext: rpm,deb,gz - if not specified, gz is default";;
      'deb')  FILE_EXT="deb";;
      'rpm')  FILE_EXT="rpm";;
      'gz')   FILE_EXT="tar.gz";;
      *)      FILE_EXT="tar.gz";;
    esac
  fi
fi

# The following wget command retrieves the latest version number for Octant
export OCTANT_VERSION=$(wget -qO- https://github.com/vmware/octant/releases/latest | sed -nE 's|.*"Recent Commits to octant:v(.*)\" .*|\1|p')

# Build the filename to download:
FILENAME="octant_$OCTANT_VERSION""_$OS-64bit"
echo https://github.com/vmware/octant/releases/download/v$OCTANT_VERSION/$FILENAME.$FILE_EXT

# Now retrieve the file:
curl -L https://github.com/vmware/octant/releases/download/v$OCTANT_VERSION/$FILENAME.$FILE_EXT -o $FILENAME.$FILE_EXT 

# Show the file that was downloaded:
ls -ahl $FILENAME.$FILE_EXT

# If the file is a tar.gz, uncompress it and run the binary to show the version:
if [ "$FILE_EXT" == "tar.gz" ]; then
  tar -zxvf $FILENAME.$FILE_EXT
  cd $FILENAME
  ./octant version
fi