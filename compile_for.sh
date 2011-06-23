#! /bin/sh

set -e
#FFLAGS="-Wall -Wextra -Wimplicit-interface -fcheck=all -fcheck-array-temporaries"
FFLAGS="-O3 -march=native -ffast-math -funroll-loops"
gfortran $FFLAGS -o laplace_for.o -c laplace_for.f90
gfortran -o laplace_for laplace_for.o
