#include "decoder.h"

void decoder::decode(){
    opcode.write(instruction.read().range(15, 13));
    rs.write(instruction.read().range(12, 9));
    rt.write(instruction.read().range(8, 5));
    immediate.write(instruction.read().range(4, 0));
}
