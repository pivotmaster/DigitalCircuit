wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/RAID2/COURSE/DCS/DCS111/HW02/01_RTL/CNN.fsdb}
wvResizeWindow -win $_nWave1 1920 23 1536 793
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_CNN"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_CNN/CNN_buffer\[0:3\]} \
{/TESTBED/u_CNN/Maxpool_buffer\[0:1\]} \
{/TESTBED/u_CNN/ReLU_buffer\[0:3\]} \
{/TESTBED/u_CNN/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetCursor -win $_nWave1 8014647.526081 -snap {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_CNN/CNN_buffer\[0:3\]} \
{/TESTBED/u_CNN/Maxpool_buffer\[0:1\]} \
{/TESTBED/u_CNN/ReLU_buffer\[0:3\]} \
{/TESTBED/u_CNN/clk} \
{/TESTBED/u_CNN/image_buffer\[0:5\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_CNN/CNN_buffer\[0:3\]} \
{/TESTBED/u_CNN/Maxpool_buffer\[0:1\]} \
{/TESTBED/u_CNN/ReLU_buffer\[0:3\]} \
{/TESTBED/u_CNN/clk} \
{/TESTBED/u_CNN/image_buffer\[0:5\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_CNN"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_CNN/CNN_buffer\[0:3\]} \
{/TESTBED/u_CNN/Maxpool_buffer\[0:1\]} \
{/TESTBED/u_CNN/ReLU_buffer\[0:3\]} \
{/TESTBED/u_CNN/clk} \
{/TESTBED/u_CNN/image_buffer\[0:5\]} \
{/TESTBED/u_CNN/in_data\[15:0\]} \
{/TESTBED/u_CNN/in_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_CNN/CNN_buffer\[0:3\]} \
{/TESTBED/u_CNN/Maxpool_buffer\[0:1\]} \
{/TESTBED/u_CNN/ReLU_buffer\[0:3\]} \
{/TESTBED/u_CNN/clk} \
{/TESTBED/u_CNN/image_buffer\[0:5\]} \
{/TESTBED/u_CNN/in_data\[15:0\]} \
{/TESTBED/u_CNN/in_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvResizeWindow -win $_nWave1 1920 23 1536 793
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetCursor -win $_nWave1 8107703.721920 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 8479189.462202 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 8313055.177202 -snap {("G1" 4)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_CNN"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_CNN"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_CNN/clk} \
{/TESTBED/u_CNN/in_valid} \
{/TESTBED/u_CNN/in_data\[15:0\]} \
{/TESTBED/u_CNN/image_buffer\[0:5\]} \
{/TESTBED/u_CNN/CNN_buffer\[0:3\]} \
{/TESTBED/u_CNN/ReLU_buffer\[0:3\]} \
{/TESTBED/u_CNN/Maxpool_buffer\[0:1\]} \
{/TESTBED/u_CNN/out_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvZoomIn -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_CNN"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_CNN"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_CNN/clk} \
{/TESTBED/u_CNN/in_valid} \
{/TESTBED/u_CNN/in_data\[15:0\]} \
{/TESTBED/u_CNN/out_data\[15:0\]} \
{/TESTBED/u_CNN/out_valid} \
{/TESTBED/u_CNN/image_buffer\[0:5\]} \
{/TESTBED/u_CNN/CNN_buffer\[0:3\]} \
{/TESTBED/u_CNN/ReLU_buffer\[0:3\]} \
{/TESTBED/u_CNN/Maxpool_buffer\[0:1\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_CNN/clk} \
{/TESTBED/u_CNN/in_valid} \
{/TESTBED/u_CNN/in_data\[15:0\]} \
{/TESTBED/u_CNN/out_data\[15:0\]} \
{/TESTBED/u_CNN/out_valid} \
{/TESTBED/u_CNN/image_buffer\[0:5\]} \
{/TESTBED/u_CNN/CNN_buffer\[0:3\]} \
{/TESTBED/u_CNN/ReLU_buffer\[0:3\]} \
{/TESTBED/u_CNN/Maxpool_buffer\[0:1\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_CNN"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_CNN"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_CNN/clk} \
{/TESTBED/u_CNN/in_valid} \
{/TESTBED/u_CNN/in_data\[15:0\]} \
{/TESTBED/u_CNN/out_data\[15:0\]} \
{/TESTBED/u_CNN/out_valid} \
{/TESTBED/u_CNN/current_state\[1:0\]} \
{/TESTBED/u_CNN/image_buffer\[0:5\]} \
{/TESTBED/u_CNN/CNN_buffer\[0:3\]} \
{/TESTBED/u_CNN/ReLU_buffer\[0:3\]} \
{/TESTBED/u_CNN/Maxpool_buffer\[0:1\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetCursor -win $_nWave1 7965456.888023 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 7964306.373584 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 7964306.373584 -snap {("G1" 7)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 7402875.461327 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 8445721.882890 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_CNN/clk} \
{/TESTBED/u_CNN/in_valid} \
{/TESTBED/u_CNN/in_data\[15:0\]} \
{/TESTBED/u_CNN/out_data\[15:0\]} \
{/TESTBED/u_CNN/out_valid} \
{/TESTBED/u_CNN/current_state\[1:0\]} \
{/TESTBED/u_CNN/ram_in\[15:0\]} \
{/TESTBED/u_CNN/image_buffer\[0:5\]} \
{/TESTBED/u_CNN/CNN_buffer\[0:3\]} \
{/TESTBED/u_CNN/ReLU_buffer\[0:3\]} \
{/TESTBED/u_CNN/Maxpool_buffer\[0:1\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetCursor -win $_nWave1 8126628.849842 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvExit
