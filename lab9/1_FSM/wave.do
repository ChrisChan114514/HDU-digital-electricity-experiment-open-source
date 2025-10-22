onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /seq_detect_tb/clk
add wave -noupdate /seq_detect_tb/data_in
add wave -noupdate /seq_detect_tb/rst_n
add wave -noupdate /seq_detect_tb/sout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1135922 ps} 0}
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
