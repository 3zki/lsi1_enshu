v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 280 -140 320 -140 {}
L 4 320 -180 360 -180 {}
L 4 360 -140 400 -140 {}
L 4 400 -140 440 -140 {}
L 4 440 -180 480 -180 {}
L 4 480 -140 520 -140 {}
L 4 280 -80 400 -80 {}
L 4 400 -120 400 -80 {}
L 4 400 -120 520 -120 {}
L 4 280 -20 320 -20 {}
L 4 320 -60 360 -60 {}
L 4 360 -20 400 -20 {}
L 4 400 -60 400 -20 {}
L 4 400 -60 440 -60 {}
L 4 440 -20 480 -20 {}
L 4 480 -60 520 -60 {}
L 4 600 -80 640 -80 {}
L 4 640 -120 680 -120 {}
L 4 680 -80 720 -80 {}
L 4 720 -80 760 -80 {}
L 4 760 -120 800 -120 {}
L 4 800 -80 840 -80 {}
L 4 600 -140 720 -140 {}
L 4 720 -180 720 -140 {}
L 4 720 -180 840 -180 {}
L 4 600 -20 640 -20 {}
L 4 640 -60 680 -60 {}
L 4 680 -20 720 -20 {}
L 4 720 -60 720 -20 {}
L 4 720 -60 760 -60 {}
L 4 760 -20 800 -20 {}
L 4 800 -60 840 -60 {}
L 10 320 -180 320 -140 {}
L 10 360 -180 360 -140 {}
L 10 440 -180 440 -140 {}
L 10 480 -180 480 -140 {}
L 10 320 -60 320 -20 {}
L 10 360 -60 360 -20 {}
L 10 440 -60 440 -20 {}
L 10 480 -60 480 -20 {}
L 10 640 -120 640 -80 {}
L 10 680 -120 680 -80 {}
L 10 760 -120 760 -80 {}
L 10 800 -120 800 -80 {}
L 10 640 -60 640 -20 {}
L 10 680 -60 680 -20 {}
L 10 760 -60 760 -20 {}
L 10 800 -60 800 -20 {}
T {A} 260 -140 2 0 0.5 0.5 {}
T {B} 260 -80 2 0 0.5 0.5 {}
T {Y} 260 -20 2 0 0.5 0.5 {}
T {B} 580 -80 2 0 0.5 0.5 {}
T {A} 580 -140 2 0 0.5 0.5 {}
T {Y} 580 -20 2 0 0.5 0.5 {}
N 750 -340 790 -340 {
lab=Y}
N 140 -360 180 -360 {
lab=A}
N 140 -320 180 -320 {
lab=B}
N 340 -360 420 -360 {
lab=pinA}
N 340 -320 420 -320 {
lab=pinB}
N 540 -340 590 -340 {
lab=pinY}
C {devices/ipin.sym} 140 -360 0 0 {name=p1 lab=A}
C {devices/ipin.sym} 140 -320 0 0 {name=p2 lab=B}
C {devices/opin.sym} 790 -340 0 0 {name=p5 lab=Y}
C {devices/simulator_commands.sym} 110 -110 0 0 {name=XOR
simulator=ngspice
only_toplevel=false 
value="
VP VDD 0 dc 1.8

// XOR_A TEST

VA A 0 dc 0
VB B 0 dc 0

.control
save a b c d y pinA pinB pinY
alter @va[PULSE] [ 0 1.8 1n 40p 40p 1n 3n ]
alter @vb[PULSE] [ 0 1.8 3n 40p 40p 4n 8n ]
tran 10p 6n
meas tran  in1 FIND time WHEN v(pina)=0.9 RISE=1 > NUL
meas tran out1 FIND time WHEN v(piny)=0.9 RISE=1 > NUL
meas tran  in2 FIND time WHEN v(pina)=0.9 FALL=1 > NUL
meas tran out2 FIND time WHEN v(piny)=0.9 FALL=1 > NUL
meas tran  in3 FIND time WHEN v(pina)=0.9 RISE=2 > NUL
meas tran out3 FIND time WHEN v(piny)=0.9 FALL=2 > NUL
meas tran  in4 FIND time WHEN v(pina)=0.9 FALL=2 > NUL
meas tran out4 FIND time WHEN v(piny)=0.9 RISE=3 > NUL

let calc1 = out1 - in1
set delayxa1 = $&calc1
let calc2 = out2 - in2
set delayxa2 = $&calc2
let calc3 = out3 - in3
set delayxa3 = $&calc3
let calc4 = out4 - in4
set delayxa4 = $&calc4

alter @vb[PULSE] [ 0 1.8 1n 40p 40p 1n 3n ]
alter @va[PULSE] [ 0 1.8 3n 40p 40p 4n 8n ]
tran 10p 6n
meas tran  in5 FIND time WHEN v(pinb)=0.9 RISE=1 > NUL
meas tran out5 FIND time WHEN v(piny)=0.9 RISE=1 > NUL
meas tran  in6 FIND time WHEN v(pinb)=0.9 FALL=1 > NUL
meas tran out6 FIND time WHEN v(piny)=0.9 FALL=1 > NUL
meas tran  in7 FIND time WHEN v(pinb)=0.9 RISE=2 > NUL
meas tran out7 FIND time WHEN v(piny)=0.9 FALL=2 > NUL
meas tran  in8 FIND time WHEN v(pinb)=0.9 FALL=2 > NUL
meas tran out8 FIND time WHEN v(piny)=0.9 RISE=3 > NUL

let calc5 = out5 - in5
set delayxa5 = $&calc5
let calc6 = out6 - in6
set delayxa6 = $&calc6
let calc7 = out7 - in7
set delayxa7 = $&calc7
let calc8 = out8 - in8
set delayxa8 = $&calc8


echo '*** XOR1 DELAY CASE 1 ***'
echo 'A(LH) when B(L) ='\{$delayxa1\}
echo 'A(HL) when B(L) ='\{$delayxa2\}
echo 'A(LH) when B(H) ='\{$delayxa3\}
echo 'A(HL) when B(H) ='\{$delayxa4\}

echo '*** XOR1 DELAY CASE 2 ***'
echo 'B(LH) when A(L) ='\{$delayxa5\}
echo 'B(HL) when A(L) ='\{$delayxa6\}
echo 'B(LH) when A(H) ='\{$delayxa7\}
echo 'B(HL) when A(H) ='\{$delayxa8\}
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
C {inverter.sym} 220 -360 0 0 {name=x1}
C {inverter.sym} 300 -360 0 0 {name=x2}
C {inverter.sym} 220 -320 0 0 {name=x3}
C {inverter.sym} 710 -340 0 0 {name=x6}
C {inverter.sym} 300 -320 0 0 {name=x4}
C {inverter.sym} 630 -340 0 0 {name=x5}
C {devices/lab_wire.sym} 360 -360 0 1 {name=p3 sig_type=std_logic lab=pinA}
C {devices/lab_wire.sym} 360 -320 0 1 {name=p4 sig_type=std_logic lab=pinB}
C {devices/lab_wire.sym} 570 -340 0 0 {name=p6 sig_type=std_logic lab=pinY}
C {devices/vdd.sym} 480 -400 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 480 -300 0 0 {name=l2 lab=GND}
