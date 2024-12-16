onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab902PCcnt_TB/pc_en
add wave -noupdate /lab902PCcnt_TB/pc_load
add wave -noupdate /lab902PCcnt_TB/pc_sel
add wave -noupdate /lab902PCcnt_TB/clk
add wave -noupdate /lab902PCcnt_TB/rstn
add wave -noupdate /lab902PCcnt_TB/PC_OFFSET
add wave -noupdate /lab902PCcnt_TB/PC_BASE
add wave -noupdate -radix decimal /lab902PCcnt_TB/Q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {350000 ps} 0}
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
WaveRestoreZoom {0 ps} {2100 ns}
