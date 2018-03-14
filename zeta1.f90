program zeta1
	implicit none
	include 'mpif.h'
	double precision :: summy=0.0,lsummy=0.0, pi=3.141592653589793, k,locsum,clock_start,clock_stop
	integer :: n,inputt,i,j,kk=1, out_unit=100, ierr,rank,saize,locn,sumlocn,templocn,status
	character*50 :: buffer
	double precision, allocatable :: v(:),v2(:)
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
	if(rank==0) then
		allocate(v2(locn),stat=status)
		do i=1,locn
			k=i
			v2(i)=1.0/(k*k)
		enddo
		if(saize>1) then
			sumlocn=locn
			do i=1,saize-1
				templocn=(n*(i+1))/saize-(n*i)/saize
				allocate(v(templocn),stat=status)
				do j=sumlocn+1,sumlocn+templocn
					k=j
					v(j-sumlocn)=1.0/(k*k)
				enddo
				sumlocn=sumlocn+templocn
				call MPI_Send(v,templocn,MPI_DOUBLE_PRECISION,i,0,MPI_COMM_WORLD,ierr)
				deallocate(v, stat=ierr)
			enddo
		endif
	else
		allocate(v2(locn),stat=status)
		call MPI_Recv(v2,locn,MPI_DOUBLE_PRECISION,0,0,MPI_COMM_WORLD,MPI_STATUS_IGNORE,ierr)
	endif
	if(inputt==0) then
		do i=1,locn
			lsummy=lsummy+v2(i)
		enddo
		if(rank==0) then
			summy=lsummy
			if(saize>1) then
				do i=1,saize-1
					call MPI_Recv(lsummy,1,MPI_DOUBLE_PRECISION,i,1,MPI_COMM_WORLD,MPI_STATUS_IGNORE,ierr)
					summy=summy+lsummy
				enddo
			endif
!			print *, "MPI: The error for the n size", n," and the number of processors", saize, "is:", abs(pi-sqrt(6*summy))
		else
			call MPI_Send(lsummy,1,MPI_DOUBLE_PRECISION,0,1,MPI_COMM_WORLD,ierr)
		endif
		!Parallel computing not deterministic,(OR IS IT!!!!!!), small differences in output
	elseif(inputt==1) then
		templocn=n-(n*(saize-1))/saize
		allocate(v(templocn),stat=status)
!		if(locn<templocn) then
!			v(templocn)=0.0
!		endif
		call MPI_Allreduce(v2,v,templocn,MPI_DOUBLE_PRECISION,MPI_SUM, MPI_COMM_WORLD, ierr)
		do i=1,templocn
			summy=summy+v(i)			
		enddo
		deallocate(v,stat=ierr)
!		print *, "Reduction: The error for the n size", n," and the number of processors", saize, "is:", abs(pi-sqrt(6*summy))
	endif
	deallocate(v2,stat=ierr)
	clock_stop=MPI_WTIME()
	if(rank==0) then
		print *,"Z1: That took", clock_stop-clock_start, "seconds for size", saize, " n ", n, " and error", abs(pi-sqrt(6*summy))
	endif
	call MPI_FINALIZE(ierr)
end program zeta1
