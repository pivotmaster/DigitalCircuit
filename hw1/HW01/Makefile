HOME = /RAID2/COURSE/DCS/DCSTA01
LIB_DIR=-L $(HOME)/systemc-2.3.3/lib-linux64
INC_DIR=-I $(HOME)/systemc-2.3.3/include
LIB=-lsystemc -Wl,-rpath,$(HOME)/systemc-2.3.3/lib-linux64

O = HW01
C = *.cpp

all:
	g++ -L . $(LIB_DIR) -I. $(INC_DIR) -o $(O) $(C) $(LIB) && ./$(O)
 
clean:
	rm -rf $(O)

tar:
	rm -rf HW01
	mkdir HW01
	cp decoder.cpp HW01/decoder.cpp
	cp decoder.h HW01/decoder.h
	cp ALU.cpp HW01/ALU.cpp
	cp ALU.h HW01/ALU.h
	tar -cvf HW01.tar HW01
	@echo "==================================="
	@echo "Tar file created successfully"
	@echo "Download HW01.tar from the server"
	@echo "Upload HW01.tar and report_DCSxxx.pdf to E3"
	@echo "==================================="
