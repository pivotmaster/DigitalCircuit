#include "ALU.h"

void ALU::process() {
    switch (opcode.read()) {
        case 0:
            ALU_out.write(rs_data.read() + rt_data.read());
            break;
        case 1:
            ALU_out.write(rs_data.read() * rt_data.read());
            break;
        case 2:
            ALU_out.write(rs_data.read() & rt_data.read());
            break;
        case 3:
            ALU_out.write(~rs_data.read());
            break;
        case 4:
            ALU_out.write(std::abs(rs_data.read()));
            break;
        case 5:
            ALU_out.write(std::min(rs_data.read(), rt_data.read()));
            break;
        case 6:
            ALU_out.write(rs_data.read() << immediate.read());
            break;
        case 7:
            if(immediate.read() & (1 << 4))
                ALU_out.write(rs_data.read() + (immediate.read() | 0xFFF0));
            else
                ALU_out.write(rs_data.read() + immediate.read());
    }
}
