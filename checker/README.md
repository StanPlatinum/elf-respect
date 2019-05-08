# This needs my own for-sgx-minimal-dependency dyninst

The zip.sh and unzip.sh scripts are used for compress the static libs in the ./lib dir.

To build the specified dyninst, a CMAKE config "-DENABLE_STATIC_LIBS=YES -DUSE_Open=OFF". But the DUSE_Open option seems not useful...

Currently I use the ./main from the ../nw dir for the target program, still need to know if it is suitable...
