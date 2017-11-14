Overall, parallelizing the ray tracer was not overly difficult. In my
implementation, the nthreads variable dictated how many threads would be
spawned to work on the problem, and split up the y sample coordinates for each
particular x, y and x sample coordinate. The multithreading speeds up the ray
tracing quite a bit, gibing it a 2x speedup when run on 4 threads.

Some issues that I faced were minor bugs where I miscopied code when making an
indipendent function for the threads to run, such as making x, y and z ints
rather than doubles. I also overlooked the full range of ys, and had to adjust
it from -halfSize to halfSize rather than from 0 to halfSize. I also faced
issues with calling threads and sharing work that I fixed by mathematically
dividing the range of ys between the number of threads.

