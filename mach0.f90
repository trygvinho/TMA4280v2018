program mach0
	implicit none
	double precision :: v=0.0,v2=0.0, summy=0.0, error=0.0, pi=3.141592653589793, k, num1=1.0/5.0,num2=1.0/239.0
	integer :: n, inputt, i,kk=1,out_unit=100
	character*50 :: buffer
	call getarg(1,buffer)
	read(buffer,*) n
	call getarg(2,buffer)
	read(buffer,*) inputt
	if (inputt==0) then
		do i=1,n
			k=i
			v=v+((1.0/5.0)**(2*k-1)/(2*k-1))*(-1)**(i-1)
			v2=v2+((1.0/239.0)**(2*k-1)/(2*k-1))*(-1)**(i-1)
		enddo
	print *, "Utest for mach the error op pi after summing n elements is:", pi-16*v+4*v2	
	endif
	if (inputt==1) then
		open(unit=out_unit,file="error_mach",action="write",status="replace")
		print *, "################################# vtest mach #####################################"
		write (out_unit,*) "################################# vtest mach #####################################"
		do i=1,2**24
			k=i
			v=v+((num1)**(2*k-1)/(2*k-1))*(-1)**(i-1)
			v2=v2+((num2)**(2*k-1)/(2*k-1))*(-1)**(i-1)
			if (i==2**kk) then
				print *, "For mach the error of pi after summing",i,"elements is:", abs(pi-16*v+4*v2)
				write (out_unit,*) "For mach the error of pi after summing",i,"elements is:", abs(pi-16*v+4*v2)
				kk=kk+1
			endif
			if (i==3) then
				print *, v-(v+((num2)**(2*k-1)/(2*k-1))*(-1)**(i-1))
			endif
		enddo
		close(out_unit)	
	endif
end program mach0
