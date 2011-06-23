from numpy import zeros
from scipy import weave
from timeit import default_timer as clock

dx = 0.1
dy = 0.1
dx2 = dx*dx
dy2 = dy*dy

def num_update(u):
    u[1:-1,1:-1] = ((u[2:,1:-1]+u[:-2,1:-1])*dy2 + \
        (u[1:-1,2:] + u[1:-1,:-2])*dx2) / (2*(dx2+dy2))

def calc(N, Niter=100, func=num_update, args=()):
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
