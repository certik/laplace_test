from numpy import zeros
from scipy import weave
from timeit import default_timer as clock

dx = 0.1
dy = 0.1
dx2 = dx*dx
dy2 = dy*dy

def py_update(u):
    nx, ny = u.shape
    for i in xrange(1,nx-1):
        for j in xrange(1, ny-1):
            u[i,j] = ((u[i+1, j] + u[i-1, j]) * dy2 +
                      (u[i, j+1] + u[i, j-1]) * dx2) / (2*(dx2+dy2))

def calc(N, Niter=100, func=py_update, args=()):
    u = zeros([N, N])
    u[0] = 1
    for i in range(Niter):
        func(u,*args)
    return u

if __name__ == "__main__":
    t = clock()
    u = calc(100, 8000)
    t = clock() - t
    print t
    print u[1, 1]
    print sum(u.flat)
    print sum((u**2).flat)
