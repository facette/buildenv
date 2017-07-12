Facette distribution helper
===========================

Build Environements
-------------------

The currently supported build environments are:

 * Debian Jessie (amd64, arm64 and armel)
 * Debian Stretch (amd64, arm64 and armel)
 * Ubuntu Xenial (amd64)

Usage
-----

Initialize the various Docker images using:

    make images

To build **all the distribution** files, execute:

    make release

To build a specific distribution, use any of the following commands:

    make debian-stretch-amd64
    make binary-jessie-armel
