program mach1
	implicit none
	include 'mpif.h'
	double precision :: summy=0.0,lsummy=0.0,summy2=0.0,lsummy2=0.0, pi=3.141592653589793, k,locsum,clock_start,clock_stop
	integer :: n,inputt,i,j,kk=1, out_unit=100, ierr,rank,saize,locn,sumlocn,templocn,status
	character*50 :: buffer
	double precision, allocatable :: v(:),v2(:),v3(:),v4(:)
	call getarg(1,buffer)
	read(buffer,*) n
	call getarg(2,buffer)
	read(buffer,*) inputt
	call MPI_INIT(ierr)
	clock_start=MPI_WTIME()
	call MPI_COMM_SIZE(MPI_COMM_WORLD,saize,ierr)
	call MPI_COMM_RANK(MPI_COMM_WORLD,rank,ierr)
	if(mod(saize,2)/=0 .and. saize/=1) then
		call MPI_FINALIZE(ierr)
		stop
	endif
	locn=(n*(rank+1))/saize-(n*rank)/saize
	!Problem lies here somewhere
	if(rank==0) then
		allocate(v2(locn),stat=status)
		allocate(v4(locn),stat=status)
		do i=1,locn
			k=i
			v2(i)=((1.0/5.0)**(2*k-1)/(2*k-1))*(-1)**(i-1)
			v4(i)=((1.0/239.0)**(2*k-1)/(2*k-1))*(-1)**(i-1)
		enddo
		if(saize>1) then
			sumlocn=locn
			do i=1,saize-1
				templocn=(n*(i+1))/saize-(n*i)/saize
				allocate(v(templocn),stat=status)
				allocate(v3(templocn),stat=status)
				do j=sumlocn+1,sumlocn+templocn
					k=j
					v(j-sumlocn)=((1.0/5.0)**(2*k-1)/(2*k-1))*(-1)**(j-1)
					v3(j-sumlocn)=((1.0/239.0)**(2*k-1)/(2*k-1))*(-1)**(j-1)
				enddo
				sumlocn=sumlocn+templocn
				call MPI_Send(v,templocn,MPI_DOUBLE_PRECISION,i,0,MPI_COMM_WORLD,ierr)
				call MPI_Send(v3,templocn,MPI_DOUBLE_PRECISION,i,1,MPI_COMM_WORLD,ierr)
				deallocate(v, stat=ierr)
				deallocate(v3,stat=ierr)
			enddo
		endif
	else
		allocate(v2(locn),stat=status)
		allocate(v4(locn),stat=status)
		call MPI_Recv(v2,locn,MPI_DOUBLE_PRECISION,0,0,MPI_COMM_WORLD,MPI_STATUS_IGNORE,ierr)
		call MPI_Recv(v4,locn,MPI_DOUBLE_PRECISION,0,1,MPI_COMM_WORLD,MPI_STATUS_IGNORE,ierr)
	endif
	!End area of emergency
	if(inputt==0) then
		do i=1,locn
			lsummy=lsummy+v2(i)
			lsummy2=lsummy2+v4(i)
		enddo
		if(rank==0) then
			summy=lsummy
			summy2=lsummy2
			if(saize>1) then
				do i=1,saize-1
					call MPI_Recv(lsummy,1,MPI_DOUBLE_PRECISION,i,2,MPI_COMM_WORLD,MPI_STATUS_IGNORE,ierr)
					call MPI_Recv(lsummy2,1,MPI_DOUBLE_PRECISION,i,3,MPI_COMM_WORLD,MPI_STATUS_IGNORE,ierr)
					summy=summy+lsummy
					summy2=summy2+lsummy2
				enddo
			endif
!			print *, "MPI: The error for the n size", n," and the number of processors", saize, "is:", abs(pi-16*summy+4*summy2)
		else
			call MPI_Send(lsummy,1,MPI_DOUBLE_PRECISION,0,2,MPI_COMM_WORLD,ierr)
			call MPI_Send(lsummy2,1,MPI_DOUBLE_PRECISION,0,3,MPI_COMM_WORLD,ierr)
		endif
		!Parallel computing not deterministic,(OR IS IT!!!!!!), small differences in output
	elseif(inputt==1) then
		templocn=n-(n*(saize-1))/saize
		allocate(v(templocn),stat=status)
		allocate(v3(templocn),stat=status)
!		if(locn<templocn) then
!			v(templocn)=0.0
!		endif
		call MPI_Allreduce(v2,v,templocn,MPI_DOUBLE_PRECISION,MPI_SUM, MPI_COMM_WORLD, ierr)
		call MPI_Allreduce(v4,v3,templocn,MPI_DOUBLE_PRECISION,MPI_SUM, MPI_COMM_WORLD, ierr)
		do i=1,templocn
			summy=summy+v(i)
			summy2=summy2+v3(i)			
		enddo
		deallocate(v,stat=ierr)
		deallocate(v3,stat=ierr)
!		print *, "Reduction: The error for the n size", n," and the number of processors", saize, "is:", abs(pi-16*summy+4*summy2)
	endif
	deallocate(v2,stat=ierr)
	deallocate(v4,stat=ierr)
	clock_stop=MPI_WTIME()
	if(rank==0) then
		print *,"M1: That took", clock_stop-clock_start, "seconds for size", saize, " n ", n, " and error", abs(pi-16*summy+4*summy2)
	endif
	call MPI_FINALIZE(ierr)
end program mach1
