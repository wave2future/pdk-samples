#!/bin/bash

if [ ! "$PalmPDK" ];then
PalmPDK=/opt/PalmPDK
fi

export BUILDDIR="Build_Host"
if [ -e "${BUILDDIR}" ]; then
	rm -rf "${BUILDDIR}"
fi
mkdir -p ${BUILDDIR}

CC="g++"

INCLUDEDIR="${PalmPDK}/include"
LIBDIR="${PalmPDK}/host/lib"

CPPFLAGS="-I${INCLUDEDIR} -I${INCLUDEDIR}/SDL -framework Cocoa -arch i386"
LDFLAGS="-L${LIBDIR}"
LIBS="-lSDL -lSDLmain -lGLESv2"
SRCDIR="../src"

$CC $CPPFLAGS $LDFLAGS $LIBS -o ${BUILDDIR}/simple $SRCDIR/simple.cpp

echo -e "\nPutting binary in Build_Host.\n"
