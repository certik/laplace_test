#! /bin/sh

set -e
gfortran -O2 -o laplace_for.o -c laplace_for.f90
gfortran -o laplace_for laplace_for.o
