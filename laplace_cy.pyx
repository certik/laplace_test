from numpy import zeros
from scipy import weave
from timeit import default_timer as clock
cimport numpy as np

dx = 0.1
dy = 0.1
dx2 = dx*dx
dy2 = dy*dy

def cy_update(np.ndarray[double, ndim=2] u, double dx2, double dy2):
    cdef unsigned int i, j
    for i in xrange(1,u.shape[0]-1):
        for j in xrange(1, u.shape[1]-1):
            u[i,j] = ((u[i+1, j] + u[i-1, j]) * dy2 +
                      (u[i, j+1] + u[i, j-1]) * dx2) / (2*(dx2+dy2))

def calc(N, Niter=100, func=cy_update, args=()):
    u = zeros([N, N])
    u[0] = 1
    for i in range(Niter):
        func(u,*args)
    return u

def run():
    t = clock()
    u = calc(100, 8000, args=(dx2, dy2))
    t = clock() - t
    print t
    print u[1, 1]
    print sum(u.flat)
    print sum((u**2).flat)
