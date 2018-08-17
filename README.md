Facette build environments
==========================

Supported Environements
-----------------------

The currently supported build environments are:

 * Debian Stretch (amd64, arm64 and armel)
 * Ubuntu Bionic (amd64)

Usage
-----

Initialize the various Docker images using:

    make images

To build **all the distribution** files, execute:

    make release

To build a specific distribution/architecture, use any of the following
commands:

    make binary-stretch-armel
    make debian-stretch-amd64
