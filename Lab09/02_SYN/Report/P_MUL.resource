 
****************************************
Report : resources
Design : P_MUL
Version: T-2022.03
Date   : Fri May 17 20:47:36 2024
****************************************


Resource Report for this hierarchy in file ../01_RTL/P_MUL.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_1        | DW01_inc       | width=32   | add_43 (P_MUL.v:43)        |
| add_x_2        | DW01_add       | width=48   | add_46 (P_MUL.v:46)        |
| mult_x_3       | DW_mult_uns    | a_width=24 | mult_48 (P_MUL.v:48)       |
|                |                | b_width=24 |                            |
| mult_x_4       | DW_mult_uns    | a_width=24 | mult_49 (P_MUL.v:49)       |
|                |                | b_width=24 |                            |
| mult_x_5       | DW_mult_uns    | a_width=24 | mult_50 (P_MUL.v:50)       |
|                |                | b_width=24 |                            |
| mult_x_6       | DW_mult_uns    | a_width=24 | mult_51 (P_MUL.v:51)       |
|                |                | b_width=24 |                            |
| DP_OP_12J1_122_2264             |            |                            |
|                | DP_OP_12J1_122_2264 |       |                            |
=============================================================================

Datapath Report for DP_OP_12J1_122_2264
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_12J1_122_2264  | add_52 (P_MUL.v:52) add_52_2 (P_MUL.v:52)           |
|                      | add_52_3 (P_MUL.v:52)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 96    |                                          |
| I2    | PI   | Unsigned | 96    |                                          |
| I3    | PI   | Unsigned | 96    |                                          |
| I4    | PI   | Unsigned | 96    |                                          |
| O1    | PO   | Unsigned | 96    | I1 + I2 + I3 + I4 (P_MUL.v:52)           |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_1            | DW01_inc         | pparch (area,speed)                 |
| add_x_2            | DW01_add         | pparch (area,speed)                 |
| mult_x_3           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_x_4           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_x_5           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_x_6           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_12J1_122_2264                   |                    |                |
|                    | DP_OP_12J1_122_2264 | str (area,speed)                 |
===============================================================================

1
