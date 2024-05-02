#include "ALU.h"

void ALU::alu(){

    if (immediate.read()[4] == 1) {
        immediate_extened.range(15, 5) = 0xFFFF;
    } else {
        immediate_extened.range(15, 5) = 0x0000;
    }
    immediate_extened.range(4, 0) = immediate.read().range(4, 0);


    rs_data_signed.range(15, 0) = rs_data.read().range(15, 0);
    rt_data_signed.range(15, 0) = rt_data.read().range(15, 0);


    switch(opcode.read()){
        case 0:
            ALU_out_signed = rs_data_signed + rt_data_signed;
            break;
        case 1:
            ALU_out_signed = rs_data_signed * rt_data_signed;
            break;
        case 2:
            ALU_out_signed = rs_data_signed & rt_data_signed;
            break; 
        case 3:
            ALU_out_signed = ~rs_data_signed;
            break;     
        case 4:
            if(rs_data_signed >= 0)
                ALU_out_signed = rs_data_signed;
            else
                ALU_out_signed = -rs_data_signed;
            break;
        case 5:
            if(rt_data_signed >= rs_data_signed)
                ALU_out_signed = rs_data_signed;
            else
                ALU_out_signed = rt_data_signed;
            break;
        case 6:
            ALU_out_signed = rs_data_signed << immediate.read();
            break;
        case 7:
            ALU_out_signed = rs_data_signed + immediate_extened;
            break;
        
    }

    ALU_out.write(ALU_out_signed.to_uint());
}