# TMA4280v2018

Answers.pdf for answers

Scripts has the names the exercise text wanted them to have.
The figures contain timing and errors for mpi and openmp, (no error for mach openmp since it's more or less constant).

Makefile calls:

make, (makes the make)

make utest

make vtest, (results can be found error_mach.txt and error_zeta.txt)

make mpi, (mpi implementation, runs for multiple problem sizes n and (NumberOfProcesses)=[1,2,4,8])

make reduc, (the same as make mpi only with reduction)

make openmp, (does the same as make mpi with (NumberOfThreads)=[1,2,4,8])

make clean
