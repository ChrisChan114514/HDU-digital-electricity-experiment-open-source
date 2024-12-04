onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dec24a_tb/a
add wave -noupdate /dec24a_tb/y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {799400 ps} 0}
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
WaveRestoreZoom {799050 ps} {800050 ps}
