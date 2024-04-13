 
****************************************
Report : resources
Design : CNN
Version: T-2022.03
Date   : Sat Apr 13 17:15:16 2024
****************************************


Resource Report for this hierarchy in file ./CNN.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gt_x_20        | DW_cmp         | width=16   | gt_209 (CNN.v:209)         |
| gt_x_21        | DW_cmp         | width=16   | gt_210 (CNN.v:210)         |
| gt_x_22        | DW_cmp         | width=16   | gt_211 (CNN.v:211)         |
| gt_x_23        | DW_cmp         | width=16   | gt_224 (CNN.v:224)         |
| gt_x_24        | DW_cmp         | width=16   | gt_225 (CNN.v:225)         |
| gt_x_25        | DW_cmp         | width=16   | gt_209_I2_I1 (CNN.v:209)   |
| gt_x_26        | DW_cmp         | width=16   | gt_210_I2_I1 (CNN.v:210)   |
| gt_x_27        | DW_cmp         | width=16   | gt_211_I2_I1 (CNN.v:211)   |
| gt_x_28        | DW_cmp         | width=16   | gt_224_I2_I1 (CNN.v:224)   |
| gt_x_29        | DW_cmp         | width=16   | gt_225_I2_I1 (CNN.v:225)   |
| gt_x_30        | DW_cmp         | width=16   | gt_209_I2 (CNN.v:209)      |
| gt_x_31        | DW_cmp         | width=16   | gt_210_I2 (CNN.v:210)      |
| gt_x_32        | DW_cmp         | width=16   | gt_211_I2 (CNN.v:211)      |
| gt_x_33        | DW_cmp         | width=16   | gt_224_I2 (CNN.v:224)      |
| gt_x_34        | DW_cmp         | width=16   | gt_225_I2 (CNN.v:225)      |
| gt_x_35        | DW_cmp         | width=16   | gt_209_I2_I2 (CNN.v:209)   |
| gt_x_36        | DW_cmp         | width=16   | gt_210_I2_I2 (CNN.v:210)   |
| gt_x_37        | DW_cmp         | width=16   | gt_211_I2_I2 (CNN.v:211)   |
| gt_x_38        | DW_cmp         | width=16   | gt_224_I2_I2 (CNN.v:224)   |
| gt_x_39        | DW_cmp         | width=16   | gt_225_I2_I2 (CNN.v:225)   |
| gt_x_185       | DW_cmp         | width=16   | gt_217 (CNN.v:217)         |
|                |                |            | gt_231 (CNN.v:231)         |
| gt_x_186       | DW_cmp         | width=16   | gt_217_I2_I1 (CNN.v:217)   |
|                |                |            | gt_231_I2_I1 (CNN.v:231)   |
| gt_x_187       | DW_cmp         | width=16   | gt_217_I2 (CNN.v:217)      |
|                |                |            | gt_231_I2 (CNN.v:231)      |
| gt_x_188       | DW_cmp         | width=16   | gt_217_I2_I2 (CNN.v:217)   |
|                |                |            | gt_231_I2_I2 (CNN.v:231)   |
| add_x_2        | DW01_inc       | width=3    | add_147 (CNN.v:147)        |
|                |                |            | add_161 (CNN.v:161)        |
| add_x_3        | DW01_inc       | width=3    | add_151 (CNN.v:151)        |
|                |                |            | add_165 (CNN.v:165)        |
| DP_OP_716J1_122_2977            |            |                            |
|                | DP_OP_716J1_122_2977 |      |                            |
| DP_OP_717J1_123_2977            |            |                            |
|                | DP_OP_717J1_123_2977 |      |                            |
| DP_OP_718J1_124_2977            |            |                            |
|                | DP_OP_718J1_124_2977 |      |                            |
| DP_OP_719J1_125_2977            |            |                            |
|                | DP_OP_719J1_125_2977 |      |                            |
| DP_OP_720J1_126_2977            |            |                            |
|                | DP_OP_720J1_126_2977 |      |                            |
| DP_OP_721J1_127_2977            |            |                            |
|                | DP_OP_721J1_127_2977 |      |                            |
| DP_OP_722J1_128_2977            |            |                            |
|                | DP_OP_722J1_128_2977 |      |                            |
| DP_OP_723J1_129_2977            |            |                            |
|                | DP_OP_723J1_129_2977 |      |                            |
| DP_OP_724J1_130_2977            |            |                            |
|                | DP_OP_724J1_130_2977 |      |                            |
| DP_OP_725J1_131_2977            |            |                            |
|                | DP_OP_725J1_131_2977 |      |                            |
| DP_OP_726J1_132_2977            |            |                            |
|                | DP_OP_726J1_132_2977 |      |                            |
| DP_OP_727J1_133_2977            |            |                            |
|                | DP_OP_727J1_133_2977 |      |                            |
| DP_OP_728J1_134_2977            |            |                            |
|                | DP_OP_728J1_134_2977 |      |                            |
| DP_OP_729J1_135_2977            |            |                            |
|                | DP_OP_729J1_135_2977 |      |                            |
| DP_OP_730J1_136_2977            |            |                            |
|                | DP_OP_730J1_136_2977 |      |                            |
| DP_OP_731J1_137_2977            |            |                            |
|                | DP_OP_731J1_137_2977 |      |                            |
=============================================================================

Datapath Report for DP_OP_716J1_122_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_716J1_122_2977 | mult_186 (CNN.v:186)                                |
|                      | add_186_3_I2_I1_I1_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I1_I1 (CNN.v:186)                   |
|                      | add_186_3_I2_I1_I1 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I1_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I1_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I1 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I1_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I1_I1 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I1_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I1_I1 (CNN.v:186)                    |
|                      | mult_186_I2_I1_I1 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I1_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I1_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I1 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I1_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I1_I1 (CNN.v:186)                    |
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
| T5    | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T6    | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T8    | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T10   | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T12   | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T14   | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T16   | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T18   | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T20   | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T5 + T6 + T8 + T10 + T12 + T14 + T16 + T18 + T20 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_717J1_123_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_717J1_123_2977 | mult_186_I2_I1 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I2_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I2_I1 (CNN.v:186)                   |
|                      | add_186_3_I2_I2_I1 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I2_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I2_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I1 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I2_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I2_I1 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I2_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I2_I1 (CNN.v:186)                    |
|                      | mult_186_I2_I2_I1 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I2_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I2_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I1 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I2_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I2_I1 (CNN.v:186)                    |
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
| T22   | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T23   | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T25   | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T27   | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T29   | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T31   | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T33   | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T35   | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T37   | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T22 + T23 + T25 + T27 + T29 + T31 + T33 + T35 + T37 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_718J1_124_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_718J1_124_2977 | mult_186_I3_I1 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I3_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I3_I1 (CNN.v:186)                   |
|                      | add_186_3_I2_I3_I1 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I3_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I3_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I1 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I3_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I3_I1 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I3_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I3_I1 (CNN.v:186)                    |
|                      | mult_186_I2_I3_I1 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I3_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I3_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I1 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I3_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I3_I1 (CNN.v:186)                    |
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
| T39   | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T40   | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T42   | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T44   | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T46   | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T48   | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T50   | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T52   | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T54   | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T39 + T40 + T42 + T44 + T46 + T48 + T50 + T52 + T54 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_719J1_125_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_719J1_125_2977 | mult_186_I4_I1 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I4_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I4_I1 (CNN.v:186)                   |
|                      | add_186_3_I2_I4_I1 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I4_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I4_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I4_I1 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I4_I1 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I4_I1 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I4_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I4_I1 (CNN.v:186)                    |
|                      | mult_186_I2_I4_I1 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I4_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I4_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I4_I1 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I4_I1 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I4_I1 (CNN.v:186)                    |
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
| T56   | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T57   | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T59   | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T61   | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T63   | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T65   | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T67   | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T69   | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T71   | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T56 + T57 + T59 + T61 + T63 + T65 + T67 + T69 + T71 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_720J1_126_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_720J1_126_2977 | mult_186_I2 (CNN.v:186)                             |
|                      | add_186_3_I2_I1_I1_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I1_I2 (CNN.v:186)                   |
|                      | add_186_3_I2_I1_I2 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I1_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I1_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I2 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I1_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I1_I2 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I1_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I1_I2 (CNN.v:186)                    |
|                      | mult_186_I2_I1_I2 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I1_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I1_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I2 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I1_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I1_I2 (CNN.v:186)                    |
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
| T73   | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T74   | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T76   | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T78   | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T80   | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T82   | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T84   | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T86   | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T88   | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T73 + T74 + T76 + T78 + T80 + T82 + T84 + T86 + T88 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_721J1_127_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_721J1_127_2977 | mult_186_I2_I2 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I2_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I2_I2 (CNN.v:186)                   |
|                      | add_186_3_I2_I2_I2 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I2_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I2_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I2 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I2_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I2_I2 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I2_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I2_I2 (CNN.v:186)                    |
|                      | mult_186_I2_I2_I2 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I2_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I2_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I2 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I2_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I2_I2 (CNN.v:186)                    |
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
| T90   | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T91   | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T93   | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T95   | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T97   | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T99   | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T101  | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T103  | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T105  | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T90 + T91 + T93 + T95 + T97 + T99 + T101 + T103 + T105 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_722J1_128_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_722J1_128_2977 | mult_186_I3_I2 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I3_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I3_I2 (CNN.v:186)                   |
|                      | add_186_3_I2_I3_I2 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I3_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I3_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I2 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I3_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I3_I2 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I3_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I3_I2 (CNN.v:186)                    |
|                      | mult_186_I2_I3_I2 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I3_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I3_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I2 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I3_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I3_I2 (CNN.v:186)                    |
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
| T107  | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T108  | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T110  | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T112  | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T114  | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T116  | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T118  | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T120  | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T122  | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T107 + T108 + T110 + T112 + T114 + T116 + T118 + T120 + T122 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_723J1_129_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_723J1_129_2977 | mult_186_I4_I2 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I4_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I4_I2 (CNN.v:186)                   |
|                      | add_186_3_I2_I4_I2 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I4_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I4_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I4_I2 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I4_I2 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I4_I2 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I4_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I4_I2 (CNN.v:186)                    |
|                      | mult_186_I2_I4_I2 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I4_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I4_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I4_I2 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I4_I2 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I4_I2 (CNN.v:186)                    |
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
| T124  | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T125  | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T127  | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T129  | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T131  | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T133  | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T135  | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T137  | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T139  | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T124 + T125 + T127 + T129 + T131 + T133 + T135 + T137 + T139 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_724J1_130_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_724J1_130_2977 | mult_186_I3 (CNN.v:186)                             |
|                      | add_186_3_I2_I1_I1_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I1_I3 (CNN.v:186)                   |
|                      | add_186_3_I2_I1_I3 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I1_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I1_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I3 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I1_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I1_I3 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I1_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I1_I3 (CNN.v:186)                    |
|                      | mult_186_I2_I1_I3 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I1_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I1_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I3 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I1_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I1_I3 (CNN.v:186)                    |
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
| T141  | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T142  | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T144  | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T146  | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T148  | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T150  | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T152  | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T154  | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T156  | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T141 + T142 + T144 + T146 + T148 + T150 + T152 + T154 + T156 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_725J1_131_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_725J1_131_2977 | mult_186_I2_I3 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I2_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I2_I3 (CNN.v:186)                   |
|                      | add_186_3_I2_I2_I3 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I2_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I2_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I3 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I2_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I2_I3 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I2_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I2_I3 (CNN.v:186)                    |
|                      | mult_186_I2_I2_I3 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I2_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I2_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I3 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I2_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I2_I3 (CNN.v:186)                    |
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
| T158  | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T159  | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T161  | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T163  | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T165  | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T167  | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T169  | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T171  | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T173  | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T158 + T159 + T161 + T163 + T165 + T167 + T169 + T171 + T173 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_726J1_132_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_726J1_132_2977 | mult_186_I3_I3 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I3_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I3_I3 (CNN.v:186)                   |
|                      | add_186_3_I2_I3_I3 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I3_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I3_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I3 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I3_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I3_I3 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I3_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I3_I3 (CNN.v:186)                    |
|                      | mult_186_I2_I3_I3 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I3_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I3_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I3 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I3_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I3_I3 (CNN.v:186)                    |
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
| T175  | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T176  | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T178  | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T180  | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T182  | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T184  | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T186  | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T188  | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T190  | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T175 + T176 + T178 + T180 + T182 + T184 + T186 + T188 + T190 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_727J1_133_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_727J1_133_2977 | mult_186_I4_I3 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I4_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I4_I3 (CNN.v:186)                   |
|                      | add_186_3_I2_I4_I3 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I4_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I4_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I4_I3 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I4_I3 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I4_I3 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I4_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I4_I3 (CNN.v:186)                    |
|                      | mult_186_I2_I4_I3 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I4_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I4_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I4_I3 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I4_I3 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I4_I3 (CNN.v:186)                    |
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
| T192  | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T193  | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T195  | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T197  | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T199  | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T201  | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T203  | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T205  | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T207  | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T192 + T193 + T195 + T197 + T199 + T201 + T203 + T205 + T207 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_728J1_134_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_728J1_134_2977 | mult_186_I4 (CNN.v:186)                             |
|                      | add_186_3_I2_I1_I1_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I1_I4 (CNN.v:186)                   |
|                      | add_186_3_I2_I1_I4 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I1_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I1_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I4 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I1_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I1_I4 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I1_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I1_I4 (CNN.v:186)                    |
|                      | mult_186_I2_I1_I4 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I1_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I1_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I4 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I1_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I1_I4 (CNN.v:186)                    |
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
| T209  | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T210  | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T212  | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T214  | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T216  | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T218  | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T220  | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T222  | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T224  | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T209 + T210 + T212 + T214 + T216 + T218 + T220 + T222 + T224 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_729J1_135_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_729J1_135_2977 | mult_186_I2_I4 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I2_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I2_I4 (CNN.v:186)                   |
|                      | add_186_3_I2_I2_I4 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I2_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I2_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I4 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I2_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I2_I4 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I2_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I2_I4 (CNN.v:186)                    |
|                      | mult_186_I2_I2_I4 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I2_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I2_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I4 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I2_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I2_I4 (CNN.v:186)                    |
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
| T226  | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T227  | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T229  | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T231  | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T233  | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T235  | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T237  | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T239  | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T241  | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T226 + T227 + T229 + T231 + T233 + T235 + T237 + T239 + T241 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_730J1_136_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_730J1_136_2977 | mult_186_I3_I4 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I3_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I3_I4 (CNN.v:186)                   |
|                      | add_186_3_I2_I3_I4 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I3_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I3_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I4 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I3_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I3_I4 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I3_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I3_I4 (CNN.v:186)                    |
|                      | mult_186_I2_I3_I4 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I3_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I3_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I4 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I3_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I3_I4 (CNN.v:186)                    |
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
| T243  | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T244  | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T246  | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T248  | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T250  | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T252  | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T254  | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T256  | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T258  | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T243 + T244 + T246 + T248 + T250 + T252 + T254 + T256 + T258 (CNN.v:186) |
==============================================================================

Datapath Report for DP_OP_731J1_137_2977
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_731J1_137_2977 | mult_186_I4_I4 (CNN.v:186)                          |
|                      | add_186_3_I2_I1_I4_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I1_I4_I4 (CNN.v:186)                   |
|                      | add_186_3_I2_I4_I4 (CNN.v:186)                      |
|                      | add_186_3_I2_I2_I4_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I2_I4_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I4_I4 (CNN.v:186)                      |
|                      | add_186_3_I2_I3_I4_I4 (CNN.v:186)                   |
|                      | add_186_3_I3_I3_I4_I4 (CNN.v:186)                   |
|                      | mult_186_I2_I1_I4_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I1_I4_I4 (CNN.v:186)                    |
|                      | mult_186_I2_I4_I4 (CNN.v:186)                       |
|                      | mult_186_I2_I2_I4_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I2_I4_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I4_I4 (CNN.v:186)                       |
|                      | mult_186_I2_I3_I4_I4 (CNN.v:186)                    |
|                      | mult_186_I3_I3_I4_I4 (CNN.v:186)                    |
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
| T260  | IFO  | Unsigned | 16    | I1 * I2 (CNN.v:186)                      |
| T261  | IFO  | Unsigned | 16    | I3 * I4 (CNN.v:186)                      |
| T263  | IFO  | Unsigned | 16    | I5 * I6 (CNN.v:186)                      |
| T265  | IFO  | Unsigned | 16    | I7 * I8 (CNN.v:186)                      |
| T267  | IFO  | Unsigned | 16    | I9 * I10 (CNN.v:186)                     |
| T269  | IFO  | Unsigned | 16    | I11 * I12 (CNN.v:186)                    |
| T271  | IFO  | Unsigned | 16    | I13 * I14 (CNN.v:186)                    |
| T273  | IFO  | Unsigned | 16    | I15 * I16 (CNN.v:186)                    |
| T275  | IFO  | Unsigned | 16    | I17 * I18 (CNN.v:186)                    |
| O1    | PO   | Unsigned | 16    | T260 + T261 + T263 + T265 + T267 + T269 + T271 + T273 + T275 (CNN.v:186) |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'add_186_3_I2_I1_I1_I1 (CNN.v:186) add_186_3_I3_I1_I1_I1 (CNN.v:186) add_186_3_I2_I1_I1 (CNN.v:186) add_186_3_I2_I2_I1_I1 (CNN.v:186) add_186_3_I3_I2_I1_I1 (CNN.v:186) add_186_3_I3_I1_I1 (CNN.v:186) add_186_3_I2_I3_I1_I1 (CNN.v:186) add_186_3_I3_I3_I1_I1 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I2_I1 (CNN.v:186) add_186_3_I3_I1_I2_I1 (CNN.v:186) add_186_3_I2_I2_I1 (CNN.v:186) add_186_3_I2_I2_I2_I1 (CNN.v:186) add_186_3_I3_I2_I2_I1 (CNN.v:186) add_186_3_I3_I2_I1 (CNN.v:186) add_186_3_I2_I3_I2_I1 (CNN.v:186) add_186_3_I3_I3_I2_I1 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I2_I1 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I3_I1 (CNN.v:186) add_186_3_I3_I1_I3_I1 (CNN.v:186) add_186_3_I2_I3_I1 (CNN.v:186) add_186_3_I2_I2_I3_I1 (CNN.v:186) add_186_3_I3_I2_I3_I1 (CNN.v:186) add_186_3_I3_I3_I1 (CNN.v:186) add_186_3_I2_I3_I3_I1 (CNN.v:186) add_186_3_I3_I3_I3_I1 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I3_I1 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I4_I1 (CNN.v:186) add_186_3_I3_I1_I4_I1 (CNN.v:186) add_186_3_I2_I4_I1 (CNN.v:186) add_186_3_I2_I2_I4_I1 (CNN.v:186) add_186_3_I3_I2_I4_I1 (CNN.v:186) add_186_3_I3_I4_I1 (CNN.v:186) add_186_3_I2_I3_I4_I1 (CNN.v:186) add_186_3_I3_I3_I4_I1 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I4_I1 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I1_I2 (CNN.v:186) add_186_3_I3_I1_I1_I2 (CNN.v:186) add_186_3_I2_I1_I2 (CNN.v:186) add_186_3_I2_I2_I1_I2 (CNN.v:186) add_186_3_I3_I2_I1_I2 (CNN.v:186) add_186_3_I3_I1_I2 (CNN.v:186) add_186_3_I2_I3_I1_I2 (CNN.v:186) add_186_3_I3_I3_I1_I2 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I2 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I2_I2 (CNN.v:186) add_186_3_I3_I1_I2_I2 (CNN.v:186) add_186_3_I2_I2_I2 (CNN.v:186) add_186_3_I2_I2_I2_I2 (CNN.v:186) add_186_3_I3_I2_I2_I2 (CNN.v:186) add_186_3_I3_I2_I2 (CNN.v:186) add_186_3_I2_I3_I2_I2 (CNN.v:186) add_186_3_I3_I3_I2_I2 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I2_I2 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I3_I2 (CNN.v:186) add_186_3_I3_I1_I3_I2 (CNN.v:186) add_186_3_I2_I3_I2 (CNN.v:186) add_186_3_I2_I2_I3_I2 (CNN.v:186) add_186_3_I3_I2_I3_I2 (CNN.v:186) add_186_3_I3_I3_I2 (CNN.v:186) add_186_3_I2_I3_I3_I2 (CNN.v:186) add_186_3_I3_I3_I3_I2 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I3_I2 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I4_I2 (CNN.v:186) add_186_3_I3_I1_I4_I2 (CNN.v:186) add_186_3_I2_I4_I2 (CNN.v:186) add_186_3_I2_I2_I4_I2 (CNN.v:186) add_186_3_I3_I2_I4_I2 (CNN.v:186) add_186_3_I3_I4_I2 (CNN.v:186) add_186_3_I2_I3_I4_I2 (CNN.v:186) add_186_3_I3_I3_I4_I2 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I4_I2 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I1_I3 (CNN.v:186) add_186_3_I3_I1_I1_I3 (CNN.v:186) add_186_3_I2_I1_I3 (CNN.v:186) add_186_3_I2_I2_I1_I3 (CNN.v:186) add_186_3_I3_I2_I1_I3 (CNN.v:186) add_186_3_I3_I1_I3 (CNN.v:186) add_186_3_I2_I3_I1_I3 (CNN.v:186) add_186_3_I3_I3_I1_I3 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I3 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I2_I3 (CNN.v:186) add_186_3_I3_I1_I2_I3 (CNN.v:186) add_186_3_I2_I2_I3 (CNN.v:186) add_186_3_I2_I2_I2_I3 (CNN.v:186) add_186_3_I3_I2_I2_I3 (CNN.v:186) add_186_3_I3_I2_I3 (CNN.v:186) add_186_3_I2_I3_I2_I3 (CNN.v:186) add_186_3_I3_I3_I2_I3 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I2_I3 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I3_I3 (CNN.v:186) add_186_3_I3_I1_I3_I3 (CNN.v:186) add_186_3_I2_I3_I3 (CNN.v:186) add_186_3_I2_I2_I3_I3 (CNN.v:186) add_186_3_I3_I2_I3_I3 (CNN.v:186) add_186_3_I3_I3_I3 (CNN.v:186) add_186_3_I2_I3_I3_I3 (CNN.v:186) add_186_3_I3_I3_I3_I3 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I3_I3 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I4_I3 (CNN.v:186) add_186_3_I3_I1_I4_I3 (CNN.v:186) add_186_3_I2_I4_I3 (CNN.v:186) add_186_3_I2_I2_I4_I3 (CNN.v:186) add_186_3_I3_I2_I4_I3 (CNN.v:186) add_186_3_I3_I4_I3 (CNN.v:186) add_186_3_I2_I3_I4_I3 (CNN.v:186) add_186_3_I3_I3_I4_I3 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I4_I3 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I1_I4 (CNN.v:186) add_186_3_I3_I1_I1_I4 (CNN.v:186) add_186_3_I2_I1_I4 (CNN.v:186) add_186_3_I2_I2_I1_I4 (CNN.v:186) add_186_3_I3_I2_I1_I4 (CNN.v:186) add_186_3_I3_I1_I4 (CNN.v:186) add_186_3_I2_I3_I1_I4 (CNN.v:186) add_186_3_I3_I3_I1_I4 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I4 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I2_I4 (CNN.v:186) add_186_3_I3_I1_I2_I4 (CNN.v:186) add_186_3_I2_I2_I4 (CNN.v:186) add_186_3_I2_I2_I2_I4 (CNN.v:186) add_186_3_I3_I2_I2_I4 (CNN.v:186) add_186_3_I3_I2_I4 (CNN.v:186) add_186_3_I2_I3_I2_I4 (CNN.v:186) add_186_3_I3_I3_I2_I4 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I2_I4 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I3_I4 (CNN.v:186) add_186_3_I3_I1_I3_I4 (CNN.v:186) add_186_3_I2_I3_I4 (CNN.v:186) add_186_3_I2_I2_I3_I4 (CNN.v:186) add_186_3_I3_I2_I3_I4 (CNN.v:186) add_186_3_I3_I3_I4 (CNN.v:186) add_186_3_I2_I3_I3_I4 (CNN.v:186) add_186_3_I3_I3_I3_I4 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I3_I4 (CNN.v:198)'.  (HDL-120)

Information: Operator associated with resources 'add_186_3_I2_I1_I4_I4 (CNN.v:186) add_186_3_I3_I1_I4_I4 (CNN.v:186) add_186_3_I2_I4_I4 (CNN.v:186) add_186_3_I2_I2_I4_I4 (CNN.v:186) add_186_3_I3_I2_I4_I4 (CNN.v:186) add_186_3_I3_I4_I4 (CNN.v:186) add_186_3_I2_I3_I4_I4 (CNN.v:186) add_186_3_I3_I3_I4_I4 (CNN.v:186)' in design 'CNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_198_I4_I4 (CNN.v:198)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gt_x_20            | DW_cmp           | apparch (area)     |                |
| gt_x_21            | DW_cmp           | apparch (area)     |                |
| gt_x_22            | DW_cmp           | apparch (area)     |                |
| gt_x_23            | DW_cmp           | apparch (area)     |                |
| gt_x_24            | DW_cmp           | apparch (area)     |                |
| gt_x_25            | DW_cmp           | apparch (area)     |                |
| gt_x_26            | DW_cmp           | apparch (area)     |                |
| gt_x_27            | DW_cmp           | apparch (area)     |                |
| gt_x_28            | DW_cmp           | apparch (area)     |                |
| gt_x_29            | DW_cmp           | apparch (area)     |                |
| gt_x_30            | DW_cmp           | apparch (area)     |                |
| gt_x_31            | DW_cmp           | apparch (area)     |                |
| gt_x_32            | DW_cmp           | apparch (area)     |                |
| gt_x_33            | DW_cmp           | apparch (area)     |                |
| gt_x_34            | DW_cmp           | apparch (area)     |                |
| gt_x_35            | DW_cmp           | apparch (area)     |                |
| gt_x_36            | DW_cmp           | apparch (area)     |                |
| gt_x_37            | DW_cmp           | apparch (area)     |                |
| gt_x_38            | DW_cmp           | apparch (area)     |                |
| gt_x_39            | DW_cmp           | apparch (area)     |                |
| gt_x_185           | DW_cmp           | apparch (area)     |                |
| gt_x_186           | DW_cmp           | apparch (area)     |                |
| gt_x_187           | DW_cmp           | apparch (area)     |                |
| gt_x_188           | DW_cmp           | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| add_x_3            | DW01_inc         | apparch (area)     |                |
| DP_OP_716J1_122_2977                  |                    |                |
|                    | DP_OP_716J1_122_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_717J1_123_2977                  |                    |                |
|                    | DP_OP_717J1_123_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_718J1_124_2977                  |                    |                |
|                    | DP_OP_718J1_124_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_719J1_125_2977                  |                    |                |
|                    | DP_OP_719J1_125_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_720J1_126_2977                  |                    |                |
|                    | DP_OP_720J1_126_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_721J1_127_2977                  |                    |                |
|                    | DP_OP_721J1_127_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_722J1_128_2977                  |                    |                |
|                    | DP_OP_722J1_128_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_723J1_129_2977                  |                    |                |
|                    | DP_OP_723J1_129_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_724J1_130_2977                  |                    |                |
|                    | DP_OP_724J1_130_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_725J1_131_2977                  |                    |                |
|                    | DP_OP_725J1_131_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_726J1_132_2977                  |                    |                |
|                    | DP_OP_726J1_132_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_727J1_133_2977                  |                    |                |
|                    | DP_OP_727J1_133_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_728J1_134_2977                  |                    |                |
|                    | DP_OP_728J1_134_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_729J1_135_2977                  |                    |                |
|                    | DP_OP_729J1_135_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_730J1_136_2977                  |                    |                |
|                    | DP_OP_730J1_136_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_731J1_137_2977                  |                    |                |
|                    | DP_OP_731J1_137_2977 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
