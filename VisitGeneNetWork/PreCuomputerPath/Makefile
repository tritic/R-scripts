CCC = g++ -O2
CCCFLAGS = -Wall

all : main


matrixTest:visit_graph.o main.o
	$(CCC) $(CCCFLAGS) $^ -o $@


%.o : %.cc
	$(CCC) -c $(CCCFLAGS) $<

matrix.o:visit_graph.h
matrixTest.o:visit_graph.h


clean:
	rm -f *.o *~  *%  *#  .#*
clean-all: clean
	        rm -f main

