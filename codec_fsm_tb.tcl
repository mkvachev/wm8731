#set QUARTUS_ROOTDIR "C:/intelFPGA/18.1/quartus"
# берём из пользовательских переменных сред
set QUARTUS_ROOTDIR $::env(QUARTUS_ROOTDIR)

# создание рабочей библиотеки для симуляции
vlib work

# компиляция платформозависимых библиотек (при необходимости)
#vlog -work work $QUARTUS_ROOTDIR/eda/sim_lib/cyclone10lp_atoms.v
#vlog -work work $QUARTUS_ROOTDIR/eda/sim_lib/altera_mf.v

# компиляция исходников (добавляем необходимые)
vlog +incdir+./ ../*.v

# указываем toplevel
vsim -novopt work.codec_fsm_tb

# добавление сигналов к отображению
add wave sim:/codec_fsm_tb/codec_fsm_inst/*

# симуляция и отображение результатов
run 1000000 ns
wave zoom full
#WaveRestoreZoom {161600 ns} [simtime]