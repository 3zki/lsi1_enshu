v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 740 -480 780 -480 {}
L 4 780 -520 820 -520 {}
L 4 820 -480 860 -480 {}
L 4 740 -460 860 -460 {}
L 4 740 -400 780 -400 {}
L 4 780 -360 820 -360 {}
L 4 820 -400 860 -400 {}
L 4 940 -420 980 -420 {}
L 4 980 -460 1020 -460 {}
L 4 1020 -420 1060 -420 {}
L 4 940 -520 1060 -520 {}
L 4 940 -400 980 -400 {}
L 4 980 -360 1020 -360 {}
L 4 1020 -400 1060 -400 {}
L 10 780 -520 780 -480 {}
L 10 820 -520 820 -480 {}
L 10 780 -400 780 -360 {}
L 10 820 -400 820 -360 {}
L 10 980 -460 980 -420 {}
L 10 1020 -460 1020 -420 {}
L 10 980 -400 980 -360 {}
L 10 1020 -400 1020 -360 {}
T {A} 720 -480 2 0 0.5 0.5 {}
T {B} 720 -420 2 0 0.5 0.5 {}
T {Y} 720 -360 2 0 0.5 0.5 {}
T {B} 920 -420 2 0 0.5 0.5 {}
T {A} 920 -480 2 0 0.5 0.5 {}
T {Y} 920 -360 2 0 0.5 0.5 {}
T {CASE1} 800 -570 2 1 0.6 0.6 {hcenter=true
vcenter=true}
T {CASE2} 1000 -570 2 1 0.6 0.6 {hcenter=true
vcenter=true}
N 280 -220 340 -220 {
lab=pinA}
N 620 -220 680 -220 {
lab=pinY}
N 90 -220 120 -220 {
lab=inA}
N 830 -220 880 -220 {
lab=outY}
N 90 -140 120 -140 {
lab=inB}
N 500 -290 520 -290 {
lab=VDD}
N 520 -320 520 -290 {
lab=VDD}
N 500 -320 520 -320 {
lab=VDD}
N 620 -290 640 -290 {
lab=VDD}
N 640 -320 640 -290 {
lab=VDD}
N 620 -320 640 -320 {
lab=VDD}
N 500 -260 620 -260 {
lab=pinY}
N 620 -260 620 -220 {
lab=pinY}
N 460 -290 460 -220 {
lab=pinA}
N 560 -290 560 -140 {
lab=pinB}
N 560 -290 580 -290 {
lab=pinB}
N 620 -110 620 -90 {
lab=#net1}
N 620 -220 620 -170 {
lab=pinY}
N 620 -140 640 -140 {
lab=GND}
N 640 -140 640 -60 {
lab=GND}
N 620 -60 640 -60 {
lab=GND}
N 640 -60 640 -30 {
lab=GND}
N 620 -30 640 -30 {
lab=GND}
N 460 -220 460 -60 {
lab=pinA}
N 460 -60 580 -60 {
lab=pinA}
N 560 -140 580 -140 {
lab=pinB}
N 530 -140 560 -140 {
lab=pinB}
N 280 -140 340 -140 {
lab=pinB}
N 380 -140 530 -140 {
lab=pinB}
N 340 -220 460 -220 {
lab=pinA}
N 340 -140 380 -140 {
lab=pinB}
C {devices/code.sym} 50 -400 0 0 {name=ngspice
only_toplevel=false
value="
VA inA 0 dc 0
VB inB 0 dc 0
VD VDD 0 dc 1.8
.control
alter @va[PULSE] [ 0 1.8 1n 40p 40p 1n 3n ]
alter @vb[PULSE] [ 1.8 1.8 1n 40p 40p 1n 3n ]
tran 10p 3n
meas tran  in1 FIND time WHEN v(pina)=0.9 RISE=1 > NUL
meas tran out1 FIND time WHEN v(piny)=0.9 FALL=1 > NUL
meas tran  in2 FIND time WHEN v(pina)=0.9 FALL=1 > NUL
meas tran out2 FIND time WHEN v(piny)=0.9 RISE=1 > NUL

let calc1 = out1 - in1
set delayna1 = $&calc1
let calc2 = out2 - in2
set delayna2 = $&calc2

alter @vb[PULSE] [ 0 1.8 1n 40p 40p 1n 3n ]
alter @va[PULSE] [ 1.8 1.8 1n 40p 40p 1n 3n ]
tran 10p 3n
meas tran  in5 FIND time WHEN v(pinb)=0.9 RISE=1 > NUL
meas tran out5 FIND time WHEN v(piny)=0.9 FALL=1 > NUL
meas tran  in6 FIND time WHEN v(pinb)=0.9 FALL=1 > NUL
meas tran out6 FIND time WHEN v(piny)=0.9 RISE=1 > NUL

let calc5 = out5 - in5
set delayna5 = $&calc5
let calc6 = out6 - in6
set delayna6 = $&calc6

echo '*** NAND DELAY CASE 1 ***'
echo 'A(LH) when B(H) ='\{$delayna1\}
echo 'A(HL) when B(H) ='\{$delayna2\}

echo '*** NAND DELAY CASE 2 ***'
echo 'B(LH) when A(H) ='\{$delayna5\}
echo 'B(HL) when A(H) ='\{$delayna6\}

.endc"}
C {devices/ipin.sym} 90 -220 0 0 {name=p10 lab=inA}
C {devices/opin.sym} 880 -220 0 0 {name=p4 lab=outY}
C {devices/lab_wire.sym} 320 -220 0 0 {name=p1 sig_type=std_logic lab=pinA}
C {devices/lab_wire.sym} 660 -220 0 0 {name=p2 sig_type=std_logic lab=pinY}
C {inverter.sym} 160 -220 0 0 {name=x1}
C {inverter.sym} 240 -220 0 0 {name=x2}
C {inverter.sym} 720 -220 0 0 {name=x4}
C {inverter.sym} 800 -220 0 0 {name=x5}
C {devices/ipin.sym} 90 -140 0 0 {name=p3 lab=inB}
C {devices/lab_wire.sym} 320 -140 0 0 {name=p5 sig_type=std_logic lab=pinB}
C {inverter.sym} 160 -140 0 0 {name=x3}
C {inverter.sym} 240 -140 0 0 {name=x6}
C {devices/vdd.sym} 500 -320 0 0 {name=l1 lab=VDD}
C {devices/vdd.sym} 620 -320 0 0 {name=l2 lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 480 -290 0 0 {name=M1
L=0.15
W=2.2
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 600 -290 0 0 {name=M2
L=0.15
W=2.2
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 600 -140 0 0 {name=M3
L=0.15
W=2
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 600 -60 0 0 {name=M4
L=0.15
W=2
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 620 -30 0 0 {name=l3 lab=GND}
C {devices/code.sym} 190 -400 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
