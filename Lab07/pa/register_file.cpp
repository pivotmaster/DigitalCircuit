#include "register_file.h"

void register_file::read() {
    read_data1.write(regs[read_reg1.read()]);
    read_data2.write(regs[read_reg2.read()]);
}