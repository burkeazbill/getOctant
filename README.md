# Get Octant

This repo holds a script that may be used to retrieve the current version of VMware's [Octant](https://github.com/vmware/octant) developer dashboard.

The script is intended for use with MacOS and Linux operating systems. It uses the output of uname -s to determine the current OS. It also checks the Octant releases page for the current version, then uses that version info plus the OS info to construct the correct url to download the file from.

By default, the script will download the .tar.gz file. If you are running Linux and prefer to get the deb or rpm file, simply pass one of those two extensions as a parameter to the script:

```bash
./getOctant.sh deb


./getOctant.sh rpm
```

To run script quickly:

```bash
curl https://raw.githubusercontent.com/burkeazbill/getOctant/master/getOctant.sh | bash
```

**WARNING:** Always check source code before running in the fashion shown above !!!
