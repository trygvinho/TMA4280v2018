program zeta0
	implicit none
	double precision :: v=0.0, summy=0.0, error=0.0, pi=3.141592653589793, k
	integer :: n,inputt,i,kk=1, out_unit=100
	character*50 :: buffer
	call getarg(1,buffer)
	read(buffer,*) n
	call getarg(2,buffer)
	read(buffer,*) inputt
	if (inputt==0) then
		do i=1,n
			k=i
			v=v+1.0/(k*k)
		enddo
	print *, "For zeta the error of pi after summing n elements is:", pi-sqrt(6*v)	
	endif
	if (inputt==1) then
		open(unit=out_unit,file="error_zeta",action="write",status="replace")
		print *, "################################# vtest zeta #####################################"
		write (out_unit,*) "################################# vtest zeta #####################################"
		do i=1,2**24
			k=i
			v=v+1.0/(k*k)
			if (i==2**kk) then
				print *, "For zeta the error of pi after summing",i,"elements is:", abs(pi-sqrt(6*v))
				write (out_unit,*) "For zeta the error of pi after summing",i,"elements is:", abs(pi-sqrt(6*v))
				kk=kk+1
			endif
		enddo
		close(out_unit)
	endif
end program zeta0
