#! /bin/sh

set -e
FFLAGS="-fcheck=all"
#FFLAGS="-O2"
gfortran $FFLAGS  -o laplace_for.o -c laplace_for.f90
gfortran -o laplace_for laplace_for.o
