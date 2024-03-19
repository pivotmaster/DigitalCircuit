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

	//immediate_extened.range(15, 4) = immediate.range(4, 4);
    //immediate_extened.range(3, 0) = immediate.range(3, 0);
    
    if (immediate[4] == 1) {
        immediate_extened.range(15, 5) = 0xFFFF;
    } else {
        immediate_extened.range(15, 5) = 0x0000;
    }

    immediate_extened.range(4, 0) = immediate;

	switch(opcode){
        case 0:
            golden_ALU_out.write( regs_p[rs] + regs_p[rt]);
            break;
        case 1:
			golden_ALU_out.write(regs_p[rs] * regs_p[rt]);
            break;
        case 2:
			golden_ALU_out.write(regs_p[rs] & regs_p[rt]);
            break;
        case 3:
            golden_ALU_out.write(~regs_p[rs]);
            break;
        case 4:
			if(regs_p[rt] < 32768)
                golden_ALU_out.write(regs_p[rs]);
            else
                golden_ALU_out.write(-regs_p[rs]);
            break;
        case 5:
            if(regs_p[rs] < 32768 && regs_p[rt] < 32768) //both positive
            {
              if(regs_p[rs] < regs_p[rt])
                golden_ALU_out.write(regs_p[rs]);
              else
                golden_ALU_out.write(regs_p[rt]);
            }
            else if(regs_p[rs] < 32768 && regs_p[rt] >= 32768)//rs positive rt negative
            {
              golden_ALU_out.write(regs_p[rt]);
            }
            else if(regs_p[rs] >= 32768 && regs_p[rt] < 32768)//rs negative rt positive
            {
              golden_ALU_out.write(regs_p[rs]);
            }
            else//both negative
            {
              if(regs_p[rs] > regs_p[rt])
                golden_ALU_out.write(regs_p[rt]);
              else
                golden_ALU_out.write(regs_p[rs]);
            }
            //if(regs_p[rs] < regs_p[rt])
                //golden_ALU_out.write(regs_p[rs]);
            //else
                //golden_ALU_out.write(regs_p[rt]);
            break;
        case 6:
			golden_ALU_out.write(regs_p[rs] << immediate);
            break;
        case 7:
			golden_ALU_out.write(regs_p[rs] + immediate_extened);
            break;
    }
    //cout << "\n " << golden_ALU_out << " " << opcode <<  " " << rs <<  " " << rt <<  " " << immediate << "\n";
}