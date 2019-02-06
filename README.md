Facette build environments
==========================

Supported environements
-----------------------

The currently supported build environments are:

 * Debian Stretch (amd64, arm64 and armel)
 * Ubuntu Bionic (amd64)

Usage
-----

Initialize the various Docker images using:

    make

To generate all the distribution files, go back to Facette source directory
and execute:

    ./misc/scripts/release.sh

Distribution files will then be available in the `dist/` directory.
