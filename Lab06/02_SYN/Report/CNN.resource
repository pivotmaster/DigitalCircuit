 
****************************************
Report : resources
Design : CNN
Version: T-2022.03
Date   : Sun Apr 28 04:35:51 2024
****************************************


Resource Report for this hierarchy in file ../01_RTL/CNN.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_3         | DW_cmp         | width=6    | lt_96 (CNN.v:96)           |
| div_4          | DW_div_uns     | a_width=6  | div_97 (CNN.v:97)          |
|                |                | b_width=3  |                            |
| rem_5          | DW_div_uns     | a_width=6  | rem_97 (CNN.v:97)          |
|                |                | b_width=3  |                            |
| lt_x_7         | DW_cmp         | width=6    | lt_102 (CNN.v:102)         |
| gte_x_8        | DW_cmp         | width=6    | gte_102 (CNN.v:102)        |
| sub_x_9        | DW01_sub       | width=7    | sub_103 (CNN.v:103)        |
| gt_x_54        | DW_cmp         | width=16   | gt_181 (CNN.v:181)         |
| gt_x_56        | DW_cmp         | width=16   | gt_182 (CNN.v:182)         |
| gt_x_58        | DW_cmp         | width=16   | gt_183 (CNN.v:183)         |
| gt_x_60        | DW_cmp         | width=16   | gt_184 (CNN.v:184)         |
| gt_x_62        | DW_cmp         | width=16   | gt_185 (CNN.v:185)         |
| gt_x_64        | DW_cmp         | width=16   | gt_186 (CNN.v:186)         |
| gt_x_66        | DW_cmp         | width=16   | gt_187 (CNN.v:187)         |
| gt_x_68        | DW_cmp         | width=16   | gt_188 (CNN.v:188)         |
| gt_x_70        | DW_cmp         | width=16   | gt_190 (CNN.v:190)         |
| gt_x_72        | DW_cmp         | width=16   | gt_191 (CNN.v:191)         |
| gt_x_74        | DW_cmp         | width=16   | gt_192 (CNN.v:192)         |
| gt_x_76        | DW_cmp         | width=16   | gt_193 (CNN.v:193)         |
| add_x_16       | DW01_add       | width=3    | add_142_13 (CNN.v:142)     |
|                |                |            | add_142_15 (CNN.v:142)     |
|                |                |            | add_142_18 (CNN.v:142)     |
| add_x_14       | DW01_add       | width=3    | add_142_11 (CNN.v:142)     |
|                |                |            | add_142_19 (CNN.v:142)     |
|                |                |            | add_142_3 (CNN.v:142)      |
| add_x_15       | DW01_inc       | width=3    | add_142_10 (CNN.v:142)     |
|                |                |            | add_142_5 (CNN.v:142)      |
|                |                |            | add_142_7 (CNN.v:142)      |
| add_x_13       | DW01_inc       | width=3    | add_142 (CNN.v:142)        |
|                |                |            | add_142_16 (CNN.v:142)     |
|                |                |            | add_142_8 (CNN.v:142)      |
| add_x_11       | DW01_inc       | width=6    | add_118 (CNN.v:118)        |
|                |                |            | add_127 (CNN.v:127)        |
| DP_OP_1761J1_122_2977           |            |                            |
|                | DP_OP_1761J1_122_2977 |     |                            |
=============================================================================

Datapath Report for DP_OP_1761J1_122_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_1761J1_122_2977 | mult_142 (CNN.v:142) add_142_2 (CNN.v:142)         |
|                      | add_142_4 (CNN.v:142) add_142_6 (CNN.v:142)         |
|                      | add_142_9 (CNN.v:142) add_142_12 (CNN.v:142)        |
|                      | add_142_14 (CNN.v:142) add_142_17 (CNN.v:142)       |
|                      | add_142_20 (CNN.v:142) mult_142_2 (CNN.v:142)       |
|                      | mult_142_3 (CNN.v:142) mult_142_4 (CNN.v:142)       |
|                      | mult_142_5 (CNN.v:142) mult_142_6 (CNN.v:142)       |
|                      | mult_142_7 (CNN.v:142) mult_142_8 (CNN.v:142)       |
|                      | mult_142_9 (CNN.v:142)                              |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 16    |                                          |
| I2    | PI   | Signed   | 16    |                                          |
| I3    | PI   | Signed   | 16    |                                          |
| I4    | PI   | Signed   | 16    |                                          |
| I5    | PI   | Signed   | 16    |                                          |
| I6    | PI   | Signed   | 16    |                                          |
| I7    | PI   | Signed   | 16    |                                          |
| I8    | PI   | Signed   | 16    |                                          |
| I9    | PI   | Signed   | 16    |                                          |
| I10   | PI   | Signed   | 16    |                                          |
| I11   | PI   | Signed   | 16    |                                          |
| I12   | PI   | Signed   | 16    |                                          |
| I13   | PI   | Signed   | 16    |                                          |
| I14   | PI   | Signed   | 16    |                                          |
| I15   | PI   | Signed   | 16    |                                          |
| I16   | PI   | Signed   | 16    |                                          |
| I17   | PI   | Signed   | 16    |                                          |
| I18   | PI   | Signed   | 16    |                                          |
| T25   | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:142)                      |
| T26   | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:142)                      |
| T28   | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:142)                      |
| T30   | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:142)                      |
| T32   | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:142)                     |
| T34   | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:142)                    |
| T36   | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:142)                    |
| T38   | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:142)                    |
| T40   | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:142)                    |
| O1    | PO   | Unsigned | 16    | T25 + T26 + T28 + T30 + T32 + T34 + T36 + T38 + T40 (CNN.v:142) |
==============================================================================


Resource Report for Ungrouped Hierarchy div_4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy rem_5
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| lt_x_3             | DW_cmp           | apparch (area)     |                |
| div_4              | DW_div_uns       | cla                |                |
| rem_5              | DW_div_uns       | cla                |                |
| lt_x_7             | DW_cmp           | apparch (area)     |                |
| gte_x_8            | DW_cmp           | apparch (area)     |                |
| sub_x_9            | DW01_sub         | apparch (area)     |                |
| gt_x_54            | DW_cmp           | apparch (area)     |                |
| gt_x_56            | DW_cmp           | apparch (area)     |                |
| gt_x_58            | DW_cmp           | apparch (area)     |                |
| gt_x_60            | DW_cmp           | apparch (area)     |                |
| gt_x_62            | DW_cmp           | apparch (area)     |                |
| gt_x_64            | DW_cmp           | apparch (area)     |                |
| gt_x_66            | DW_cmp           | apparch (area)     |                |
| gt_x_68            | DW_cmp           | apparch (area)     |                |
| gt_x_70            | DW_cmp           | apparch (area)     |                |
| gt_x_72            | DW_cmp           | apparch (area)     |                |
| gt_x_74            | DW_cmp           | apparch (area)     |                |
| gt_x_76            | DW_cmp           | apparch (area)     |                |
| add_x_16           | DW01_add         | apparch (area)     |                |
| add_x_14           | DW01_add         | apparch (area)     |                |
| add_x_15           | DW01_inc         | apparch (area)     |                |
| add_x_13           | DW01_inc         | apparch (area)     |                |
| add_x_11           | DW01_inc         | apparch (area)     |                |
| DP_OP_1761J1_122_2977                 |                    |                |
|                    | DP_OP_1761J1_122_2977 | str (area,speed)               |
|                    |                  | mult_arch: benc_radix4              |
===============================================================================

1
