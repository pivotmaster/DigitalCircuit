#include "Pattern.h"

void Pattern::pattern() {
  int instruction_int = rand() % 65536;
	instruction = instruction_int;

	//golden_immediate = instruction.read().range(4,0);

	//calculate();
	
	cycle++;
    if ( cycle == CYCLE ) {
		sc_stop();
	}

}

void Pattern::calculate()  {
	sc_uint <3> opcode;
    sc_uint <4> rs;
    sc_uint <4> rt;
    sc_uint <5> immediate;
	sc_int <16> immediate_extened;

	opcode 		= instruction.read().range(15,13);
	rs 			= instruction.read().range(12,9);
	rt 			= instruction.read().range(8,5);
	immediate 	= instruction.read().range(4,0);
 
 golden_immediate = instruction.read().range(4,0);

	if (immediate[4] == 1) {
        immediate_extened.range(15, 5) = 0xFFFF;
    } else {
        immediate_extened.range(15, 5) = 0x0000;
    }

    immediate_extened.range(4, 0) = immediate;


    golden_rs_data_signed.range(15, 0) = regs_p[rs].range(15, 0);
    golden_rt_data_signed.range(15, 0) = regs_p[rt].range(15, 0);

	switch(opcode){
        case 0:
            golden_ALU_out_signed = golden_rs_data_signed + golden_rt_data_signed;
            break;
        case 1:
			golden_ALU_out_signed = golden_rs_data_signed * golden_rt_data_signed;
            break;
        case 2:
			golden_ALU_out_signed = golden_rs_data_signed & golden_rt_data_signed;
            break;
        case 3:
            golden_ALU_out_signed = ~golden_rs_data_signed;
            break;
        case 4:
			if(golden_rs_data_signed >= 0)
                golden_ALU_out_signed = golden_rs_data_signed;
            else
                golden_ALU_out_signed = -golden_rs_data_signed;
            break;
        case 5:
            if(golden_rs_data_signed < golden_rt_data_signed)
                golden_ALU_out_signed = golden_rs_data_signed;
            else
                golden_ALU_out_signed = golden_rt_data_signed;
            break;
        case 6:
			golden_ALU_out_signed = golden_rs_data_signed << immediate;
            break;
        case 7:
			golden_ALU_out_signed = golden_rs_data_signed + immediate_extened;
            break;
    }

    golden_ALU_out.write(golden_ALU_out_signed.to_uint());
}