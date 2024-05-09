HOME = /RAID2/COURSE/DCS/DCSTA01
LIB_DIR=-L $(HOME)/systemc-2.3.3/lib-linux64
INC_DIR=-I $(HOME)/systemc-2.3.3/include
LIB=-lsystemc -Wl,-rpath,$(HOME)/systemc-2.3.3/lib-linux64

O = HW03
C = *.cpp

all:
	g++ -L . $(LIB_DIR) -I. $(INC_DIR) -o $(O) $(C) $(LIB) && ./$(O) 2>&1 | tee systemc.log
clean:
	rm -rf $(O)