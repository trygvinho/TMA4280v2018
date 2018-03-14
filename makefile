output: zeta0.o mach0.o mach1.o zeta1.o mach2.o zeta2.o
	f95 zeta0.o -o z0 -lm
	f95 mach0.o -o m0 -lm
	mpif90 mach1.o -o m1 -lm
	mpif90 zeta1.o -o z1 -lm
	mpicc mach2.o -o outpat3 -lm -fopenmp
	mpicc zeta2.o -o output3 -lm -fopenmp

zeta0.o: zeta0.f90
	f95 -c zeta0.f90 -lm

mach0.o: mach0.f90
	f95 -c mach0.f90 -lm

mach1.o: mach1.f90
	mpif90 -c mach1.f90 -lm

zeta1.o: zeta1.f90
	mpif90 -c zeta1.f90 -lm

mach2.o: mach2.c
	mpicc -c mach2.c -lm -fopenmp

zeta2.o: zeta2.c
	mpicc -c zeta2.c -lm -fopenmp

utest:	z0 m0
	./z0 3 0
	./m0 3 0

vtest: z0 m0
	./z0 3 1
	./m0 3 1

mpi: z1 m1
	mpirun -np 1 ./z1 8 0
	mpirun -np 1 ./z1 64 0
	mpirun -np 1 ./z1 512 0
	mpirun -np 1 ./z1 4096 0
	mpirun -np 1 ./z1 32768 0
	mpirun -np 1 ./z1 262144 0
	mpirun -np 1 ./z1 2097152 0
	mpirun -np 1 ./z1 16777216 0
	mpirun -np 1 ./z1 134217728 0
	mpirun -np 2 ./z1 8 0
	mpirun -np 2 ./z1 64 0
	mpirun -np 2 ./z1 512 0
	mpirun -np 2 ./z1 4096 0
	mpirun -np 2 ./z1 32768 0
	mpirun -np 2 ./z1 262144 0
	mpirun -np 2 ./z1 2097152 0
	mpirun -np 2 ./z1 16777216 0
	mpirun -np 2 ./z1 134217728 0
	mpirun -np 4 ./z1 8 0
	mpirun -np 4 ./z1 64 0
	mpirun -np 4 ./z1 512 0
	mpirun -np 4 ./z1 4096 0
	mpirun -np 4 ./z1 32768 0
	mpirun -np 4 ./z1 262144 0
	mpirun -np 4 ./z1 2097152 0
	mpirun -np 4 ./z1 16777216 0
	mpirun -np 4 ./z1 134217728 0
	mpirun -np 8 ./z1 8 0
	mpirun -np 8 ./z1 64 0
	mpirun -np 8 ./z1 512 0
	mpirun -np 8 ./z1 4096 0
	mpirun -np 8 ./z1 32768 0
	mpirun -np 8 ./z1 262144 0
	mpirun -np 8 ./z1 2097152 0
	mpirun -np 8 ./z1 16777216 0
	mpirun -np 8 ./z1 134217728 0
	mpirun -np 1 ./m1 8 0
	mpirun -np 1 ./m1 64 0
	mpirun -np 1 ./m1 512 0
	mpirun -np 1 ./m1 4096 0
	mpirun -np 1 ./m1 32768 0
	mpirun -np 1 ./m1 262144 0
	mpirun -np 1 ./m1 2097152 0
	mpirun -np 1 ./m1 16777216 0
	mpirun -np 1 ./m1 134217728 0
	mpirun -np 2 ./m1 8 0
	mpirun -np 2 ./m1 64 0
	mpirun -np 2 ./m1 512 0
	mpirun -np 2 ./m1 4096 0
	mpirun -np 2 ./m1 32768 0
	mpirun -np 2 ./m1 262144 0
	mpirun -np 2 ./m1 2097152 0
	mpirun -np 2 ./m1 16777216 0
	mpirun -np 2 ./m1 134217728 0
	mpirun -np 4 ./m1 8 0
	mpirun -np 4 ./m1 64 0
	mpirun -np 4 ./m1 512 0
	mpirun -np 4 ./m1 4096 0
	mpirun -np 4 ./m1 32768 0
	mpirun -np 4 ./m1 262144 0
	mpirun -np 4 ./m1 2097152 0
	mpirun -np 4 ./m1 16777216 0
	mpirun -np 4 ./m1 134217728 0
	mpirun -np 8 ./m1 8 0
	mpirun -np 8 ./m1 64 0
	mpirun -np 8 ./m1 512 0
	mpirun -np 8 ./m1 4096 0
	mpirun -np 8 ./m1 32768 0
	mpirun -np 8 ./m1 262144 0
	mpirun -np 8 ./m1 2097152 0
	mpirun -np 8 ./m1 16777216 0
	mpirun -np 8 ./m1 134217728 0


reduc: z1 m1
	mpirun -np 1 ./z1 8 1
	mpirun -np 1 ./z1 64 1
	mpirun -np 1 ./z1 512 1
	mpirun -np 1 ./z1 4096 1
	mpirun -np 1 ./z1 32768 1
	mpirun -np 1 ./z1 262144 1
	mpirun -np 1 ./z1 2097152 1
	mpirun -np 1 ./z1 16777216 1
	mpirun -np 1 ./z1 134217728 1
	mpirun -np 2 ./z1 8 1
	mpirun -np 2 ./z1 64 1
	mpirun -np 2 ./z1 512 1
	mpirun -np 2 ./z1 4096 1
	mpirun -np 2 ./z1 32768 1
	mpirun -np 2 ./z1 262144 1
	mpirun -np 2 ./z1 2097152 1
	mpirun -np 2 ./z1 16777216 1
	mpirun -np 2 ./z1 134217728 1
	mpirun -np 4 ./z1 8 1
	mpirun -np 4 ./z1 64 1
	mpirun -np 4 ./z1 512 1
	mpirun -np 4 ./z1 4096 1
	mpirun -np 4 ./z1 32768 1
	mpirun -np 4 ./z1 262144 1
	mpirun -np 4 ./z1 2097152 1
	mpirun -np 4 ./z1 16777216 1
	mpirun -np 4 ./z1 134217728 1
	mpirun -np 8 ./z1 8 1
	mpirun -np 8 ./z1 64 1
	mpirun -np 8 ./z1 512 1
	mpirun -np 8 ./z1 4096 1
	mpirun -np 8 ./z1 32768 1
	mpirun -np 8 ./z1 262144 1
	mpirun -np 8 ./z1 2097152 1
	mpirun -np 8 ./z1 16777216 1
	mpirun -np 8 ./z1 134217728 1
	mpirun -np 1 ./m1 8 1
	mpirun -np 1 ./m1 64 1
	mpirun -np 1 ./m1 512 1
	mpirun -np 1 ./m1 4096 1
	mpirun -np 1 ./m1 32768 1
	mpirun -np 1 ./m1 262144 1
	mpirun -np 1 ./m1 2097152 1
	mpirun -np 1 ./m1 16777216 1
	mpirun -np 1 ./m1 134217728 1
	mpirun -np 2 ./m1 8 1
	mpirun -np 2 ./m1 64 1
	mpirun -np 2 ./m1 512 1
	mpirun -np 2 ./m1 4096 1
	mpirun -np 2 ./m1 32768 1
	mpirun -np 2 ./m1 262144 1
	mpirun -np 2 ./m1 2097152 1
	mpirun -np 2 ./m1 16777216 1
	mpirun -np 2 ./m1 134217728 1
	mpirun -np 4 ./m1 8 1
	mpirun -np 4 ./m1 64 1
	mpirun -np 4 ./m1 512 1
	mpirun -np 4 ./m1 4096 1
	mpirun -np 4 ./m1 32768 1
	mpirun -np 4 ./m1 262144 1
	mpirun -np 4 ./m1 2097152 1
	mpirun -np 4 ./m1 16777216 1
	mpirun -np 4 ./m1 134217728 1
	mpirun -np 8 ./m1 8 1
	mpirun -np 8 ./m1 64 1
	mpirun -np 8 ./m1 512 1
	mpirun -np 8 ./m1 4096 1
	mpirun -np 8 ./m1 32768 1
	mpirun -np 8 ./m1 262144 1
	mpirun -np 8 ./m1 2097152 1
	mpirun -np 8 ./m1 16777216 1
	mpirun -np 8 ./m1 134217728 1

openmp: output3 outpat3
	OMP_NUM_THREADS=1 mpirun -n 1 ./output3 3
	OMP_NUM_THREADS=2 mpirun -n 1 ./output3 3
	OMP_NUM_THREADS=4 mpirun -n 1 ./output3 3
	OMP_NUM_THREADS=8 mpirun -n 1 ./output3 3
	OMP_NUM_THREADS=1 mpirun -n 1 ./output3 6
	OMP_NUM_THREADS=2 mpirun -n 1 ./output3 6
	OMP_NUM_THREADS=4 mpirun -n 1 ./output3 6
	OMP_NUM_THREADS=8 mpirun -n 1 ./output3 6
	OMP_NUM_THREADS=1 mpirun -n 1 ./output3 9
	OMP_NUM_THREADS=2 mpirun -n 1 ./output3 9
	OMP_NUM_THREADS=4 mpirun -n 1 ./output3 9
	OMP_NUM_THREADS=8 mpirun -n 1 ./output3 9
	OMP_NUM_THREADS=1 mpirun -n 1 ./output3 12
	OMP_NUM_THREADS=2 mpirun -n 1 ./output3 12
	OMP_NUM_THREADS=4 mpirun -n 1 ./output3 12
	OMP_NUM_THREADS=8 mpirun -n 1 ./output3 12
	OMP_NUM_THREADS=1 mpirun -n 1 ./output3 15
	OMP_NUM_THREADS=2 mpirun -n 1 ./output3 15
	OMP_NUM_THREADS=4 mpirun -n 1 ./output3 15
	OMP_NUM_THREADS=8 mpirun -n 1 ./output3 15
	OMP_NUM_THREADS=1 mpirun -n 1 ./output3 18
	OMP_NUM_THREADS=2 mpirun -n 1 ./output3 18
	OMP_NUM_THREADS=4 mpirun -n 1 ./output3 18
	OMP_NUM_THREADS=8 mpirun -n 1 ./output3 18
	OMP_NUM_THREADS=1 mpirun -n 1 ./output3 21
	OMP_NUM_THREADS=2 mpirun -n 1 ./output3 21
	OMP_NUM_THREADS=4 mpirun -n 1 ./output3 21
	OMP_NUM_THREADS=8 mpirun -n 1 ./output3 21
	OMP_NUM_THREADS=1 mpirun -n 1 ./output3 24
	OMP_NUM_THREADS=2 mpirun -n 1 ./output3 24
	OMP_NUM_THREADS=4 mpirun -n 1 ./output3 24
	OMP_NUM_THREADS=8 mpirun -n 1 ./output3 24
	OMP_NUM_THREADS=1 mpirun -n 1 ./output3 27
	OMP_NUM_THREADS=2 mpirun -n 1 ./output3 27
	OMP_NUM_THREADS=4 mpirun -n 1 ./output3 27
	OMP_NUM_THREADS=8 mpirun -n 1 ./output3 27
	OMP_NUM_THREADS=1 mpirun -n 1 ./outpat3 3
	OMP_NUM_THREADS=2 mpirun -n 1 ./outpat3 3
	OMP_NUM_THREADS=4 mpirun -n 1 ./outpat3 3
	OMP_NUM_THREADS=8 mpirun -n 1 ./outpat3 3
	OMP_NUM_THREADS=1 mpirun -n 1 ./outpat3 6
	OMP_NUM_THREADS=2 mpirun -n 1 ./outpat3 6
	OMP_NUM_THREADS=4 mpirun -n 1 ./outpat3 6
	OMP_NUM_THREADS=8 mpirun -n 1 ./outpat3 6
	OMP_NUM_THREADS=1 mpirun -n 1 ./outpat3 9
	OMP_NUM_THREADS=2 mpirun -n 1 ./outpat3 9
	OMP_NUM_THREADS=4 mpirun -n 1 ./outpat3 9
	OMP_NUM_THREADS=8 mpirun -n 1 ./outpat3 9
	OMP_NUM_THREADS=1 mpirun -n 1 ./outpat3 12
	OMP_NUM_THREADS=2 mpirun -n 1 ./outpat3 12
	OMP_NUM_THREADS=4 mpirun -n 1 ./outpat3 12
	OMP_NUM_THREADS=8 mpirun -n 1 ./outpat3 12
	OMP_NUM_THREADS=1 mpirun -n 1 ./outpat3 15
	OMP_NUM_THREADS=2 mpirun -n 1 ./outpat3 15
	OMP_NUM_THREADS=4 mpirun -n 1 ./outpat3 15
	OMP_NUM_THREADS=8 mpirun -n 1 ./outpat3 15
	OMP_NUM_THREADS=1 mpirun -n 1 ./outpat3 18
	OMP_NUM_THREADS=2 mpirun -n 1 ./outpat3 18
	OMP_NUM_THREADS=4 mpirun -n 1 ./outpat3 18
	OMP_NUM_THREADS=8 mpirun -n 1 ./outpat3 18
	OMP_NUM_THREADS=1 mpirun -n 1 ./outpat3 21
	OMP_NUM_THREADS=2 mpirun -n 1 ./outpat3 21
	OMP_NUM_THREADS=4 mpirun -n 1 ./outpat3 21
	OMP_NUM_THREADS=8 mpirun -n 1 ./outpat3 21
	OMP_NUM_THREADS=1 mpirun -n 1 ./outpat3 24
	OMP_NUM_THREADS=2 mpirun -n 1 ./outpat3 24
	OMP_NUM_THREADS=4 mpirun -n 1 ./outpat3 24
	OMP_NUM_THREADS=8 mpirun -n 1 ./outpat3 24
	OMP_NUM_THREADS=1 mpirun -n 1 ./outpat3 27
	OMP_NUM_THREADS=2 mpirun -n 1 ./outpat3 27
	OMP_NUM_THREADS=4 mpirun -n 1 ./outpat3 27
	OMP_NUM_THREADS=8 mpirun -n 1 ./outpat3 27


clean:
	rm *.o z0 m0 z1 m1 output3 outpat3
