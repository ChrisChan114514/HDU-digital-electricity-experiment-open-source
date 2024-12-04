onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ALUmul_tb/A
add wave -noupdate /ALUmul_tb/B
add wave -noupdate /ALUmul_tb/ALUOP
add wave -noupdate /ALUmul_tb/S
add wave -noupdate /ALUmul_tb/multiplicand
add wave -noupdate /ALUmul_tb/multiplier
add wave -noupdate /ALUmul_tb/result
add wave -noupdate /ALUmul_tb/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1156665 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {4095 ns}
