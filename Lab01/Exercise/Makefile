HOME = /RAID2/COURSE/DCS/DCSTA01
LIB_DIR=-L $(HOME)/systemc-2.3.3/lib-linux64
INC_DIR=-I $(HOME)/systemc-2.3.3/include
LIB=-lsystemc -Wl,-rpath,$(HOME)/systemc-2.3.3/lib-linux64

O = NN
C = *.cpp

all:
	g++ -L . $(LIB_DIR) -I. $(INC_DIR) -o $(O) $(C) $(LIB) && ./$(O)
 
clean:
	rm -rf $(O)