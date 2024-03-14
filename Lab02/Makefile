HOME = /RAID2/COURSE/DCS/DCSTA01
LIB_DIR=-L $(HOME)/systemc-2.3.3/lib-linux64
INC_DIR=-I $(HOME)/systemc-2.3.3/include
LIB=-lsystemc -Wl,-rpath,$(HOME)/systemc-2.3.3/lib-linux64
APP=port2port

all:port2port.cpp
	g++ $(APP).cpp -o $(APP) $(LIB_DIR) $(INC_DIR) $(LIB) && ./$(APP)

clean:
	rm -rf $(APP)