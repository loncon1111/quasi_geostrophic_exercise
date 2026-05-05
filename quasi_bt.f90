PROGRAM quasi_geostrophic_exercise
   !!! Bài tập: Phân tích các trường động lực học tại mực 500 hPa
   implicit none
   ! Cac cau lenh khai bao
   integer, parameter :: nx = 101, ny = 101, nt = 100 !*
   real, parameter :: pi = 4*atan(1.)
   real :: U0, f0, V, c, beta, alpha  !*
   real :: k, l, Lx, Ly    
   real :: dx, dy, dt !*
   integer :: i,j,it,irec  !*
   real :: t,tmp          !* thoi gian
   real, dimension(nx, ny) :: x, y !* khong gian
   real, dimension(nx, ny, nt) :: phi, ug, vg, zeta_g ! *output

   ! Cac cau lenh thuc hien
   alpha = 0.4  ! tham so hinh dang
   ! Khai bao hang so
   U0 = 30.    ! m/s
   f0 = 1e-4   ! 1/s
   V  = 25.    ! m/s
   c  = 60.    ! m/s
   Lx = 6e6    ! m
   Ly = 4e6    ! m
   k  = 2*pi/Lx  ! so song X
   l  = 2*pi/Ly  ! so song Y
   beta = 1.67e-11 ! Tham so Beta
   dx = (3e6 - (-3e6)) / (nx-1)    ! Khoang cach luoi X
   dy = (1e6 - (-1e6)) / (ny-1)    ! Khoang cach luoi Y
   dt = 60.    !* s

   do it = 1, nt  !*
      t = (it - 1) * dt
   do i = 1, nx
   do j = 1, ny
      ! Xac dinh x, y
      x(i,j) = -3e6 + real(i-1)*dx ! m
      y(i,j) = -1e6 + real(j-1)*dy ! m
      ! Truong dia the vi
      tmp = k*( x(i,j) - c*t ) !* bien tam
      phi(i,j, it) = 5.5e4 - U0*f0*y(i,j) + V*f0*1/k*( sin(tmp)+alpha*sin(2*tmp) )*cos(l*y(i,j))
      ! Truong gio
      ug(i,j, it) = U0 + V *l/k* ( sin(tmp)+alpha*sin(2*tmp) ) * sin(l*y(i,j)) 
      vg(i,j, it) = V * ( cos(tmp)+alpha*cos(2*tmp) ) * cos(l*y(i,j))
      ! Truong do xoay
      zeta_g(i,j, it) = -V * ( (k+l**2/k)*sin(tmp) + (4*k+alpha*l**2/k)*sin(2*tmp) )*cos(l*y(i,j))
   end do
   end do
   end do !*
   ! Ghi file
   open(10,file='quasi.dat',status='unknown',form='unformatted',access='direct',recl=4*nx*ny)
      irec = 0
      do it = 1,nt
         write(10,rec=irec+1) ((phi(i,j,it)   , i=1,nx), j=1,ny)
         write(10,rec=irec+2) ((ug(i,j,it)    , i=1,nx), j=1,ny)
         write(10,rec=irec+3) ((vg(i,j,it)    , i=1,nx), j=1,ny)
         write(10,rec=irec+4) ((zeta_g(i,j,it), i=1,nx), j=1,ny)
         irec = irec + 4
      end do
   close(10)
END PROGRAM
