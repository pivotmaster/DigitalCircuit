#include "memory.h"

void memory::write() {
    if (write_enable == 1) {
        mem[address.read()] = data_in.read();
    }
}
void memory::read() {
    data_out.write(mem[address.read()]);
}