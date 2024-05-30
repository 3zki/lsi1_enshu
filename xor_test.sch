v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 320 -140 360 -140 {}
L 4 360 -180 360 -140 {}
L 4 360 -180 400 -180 {}
L 4 400 -180 400 -140 {}
L 4 400 -140 440 -140 {}
L 4 440 -180 440 -140 {}
L 4 440 -180 480 -180 {}
L 4 320 -80 400 -80 {}
L 4 400 -120 400 -80 {}
L 4 400 -120 480 -120 {}
L 4 320 -20 360 -20 {}
L 4 360 -60 360 -20 {}
L 4 360 -60 440 -60 {}
L 4 440 -60 440 -20 {}
L 4 440 -20 480 -20 {}
T {A} 300 -140 2 0 0.5 0.5 {}
T {B} 300 -80 2 0 0.5 0.5 {}
T {Y} 300 -20 2 0 0.5 0.5 {}
N 300 -340 340 -340 {
lab=Y}
N 140 -360 180 -360 {
lab=A}
N 140 -320 180 -320 {
lab=B}
C {devices/ipin.sym} 140 -360 0 0 {name=p1 lab=A}
C {devices/ipin.sym} 140 -320 0 0 {name=p2 lab=B}
C {devices/opin.sym} 340 -340 0 0 {name=p5 lab=Y}
C {devices/simulator_commands.sym} 110 -110 0 0 {name=XOR_A
simulator=ngspice
only_toplevel=false 
value="
VP VDD 0 dc 1.8

// XOR_A TEST

VA A 0 dc 0
VB B 0 dc 1.8

.control
save a b c d y
alter @va[PULSE] [ 1.8 0 1n 40p 40p 10n 20n ]
alter @vb[PULSE] [ 1.8 0 1n 40p 40p 20n 40n ]
tran 10p 60n
meas tran test1 FIND v(y) WHEN time=5n > NUL
meas tran test2 FIND v(y) WHEN time=15n > NUL
meas tran test3 FIND v(y) WHEN time=25n > NUL
meas tran test4 FIND v(y) WHEN time=35n > NUL
echo '*** TEST ***'
echo '-B--A--Y-'
echo -n '-L--L--'
if test1 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-L--H--'
if test2 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-H--L--'
if test3 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-H--H--'
if test4 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
.endc
"}
C {devices/code.sym} -10 -110 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".param mc_mm_switch=0
.param mc_pr_switch=0
.include $::SKYWATER_MODELS/corners/tt.spice
.include $::SKYWATER_MODELS/r+c/res_typical__cap_typical.spice
.include $::SKYWATER_MODELS/r+c/res_typical__cap_typical__lin.spice
.include $::SKYWATER_MODELS/corners/tt/specialized_cells.spice
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
"}
C {devices/vdd.sym} 240 -400 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 240 -280 0 0 {name=l2 lab=GND}
