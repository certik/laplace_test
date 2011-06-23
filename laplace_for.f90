program laplace_for
implicit none
integer, parameter :: dp=kind(0.d0)

integer, parameter :: N = 100
real(dp) :: u(N, N), t1, t2
call cpu_time(t1)
u = calc(N, 8000, 0.1_dp, 0.1_dp)
call cpu_time(t2)
print *, t2-t1
print *, u(2, 2)
contains

subroutine for_update(u, dx2, dy2)
real(dp), intent(inout) :: u(:,:)
real(dp), intent(in) :: dx2, dy2
integer :: n1, n2
n1 = size(u, 1)
n2 = size(u, 2)
u(2:n1-1,2:n2-1) = ((u(3:,2:n2-1)+u(:n2-2,2:n2-1))*dy2 + &
        (u(2:n1-1,3:) + u(2:n1-1,:n2-2))*dx2) / (2*(dx2+dy2))
end subroutine

function calc(N, Niter, dx, dy) result(u)
integer, intent(in) :: N, Niter
real(dp), intent(in) :: dx, dy
real(dp) :: u(N,N), dx2, dy2
integer :: i
u = 0
u(1,:) = 1
dx2 = dx**2
dy2 = dy**2
do i = 1, Niter
    call for_update(u, dx2, dy2)
end do
end function

end program
