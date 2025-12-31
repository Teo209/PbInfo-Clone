# PbInfo-Clone
Note that this version runs locally and does not include a web interface, which will be added in the future.

## Instructions
1. Add the problem's text in <code>problem.md</code> (__optional__)
2. Add the expected output in <code>solutions/solution1.txt</code>
3. Add test inputs in <code>tests/test1.txt</code>
4. Solve the problem in <code>main.cpp</code>
5. Repeat steps _2._ and _3._ for more tests, just increment the number
6. Run <code>./test.sh</code>


### Compiling
The Makefile is preconfigured for Linux.
Available commands are:
- make -> Compiles and links main.cpp
- make clean -> Removes the Generated Files
- make run -> Compiles, links and then runs the executable  

but the file compiles automatically.
