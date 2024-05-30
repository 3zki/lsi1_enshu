v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 580 -520 620 -520 {}
L 4 620 -560 660 -560 {}
L 4 660 -520 700 -520 {}
L 4 580 -460 700 -460 {}
L 4 580 -440 620 -440 {}
L 4 620 -400 660 -400 {}
L 4 660 -440 700 -440 {}
L 4 780 -460 820 -460 {}
L 4 820 -500 860 -500 {}
L 4 860 -460 900 -460 {}
L 4 780 -560 900 -560 {}
L 4 780 -400 820 -400 {}
L 4 820 -440 860 -440 {}
L 4 860 -400 900 -400 {}
L 10 620 -560 620 -520 {}
L 10 660 -560 660 -520 {}
L 10 620 -440 620 -400 {}
L 10 660 -440 660 -400 {}
L 10 820 -500 820 -460 {}
L 10 860 -500 860 -460 {}
L 10 820 -440 820 -400 {}
L 10 860 -440 860 -400 {}
T {A} 560 -520 2 0 0.5 0.5 {}
T {B} 560 -460 2 0 0.5 0.5 {}
T {Y} 560 -400 2 0 0.5 0.5 {}
T {B} 760 -460 2 0 0.5 0.5 {}
T {A} 760 -520 2 0 0.5 0.5 {}
T {Y} 760 -400 2 0 0.5 0.5 {}
N 280 -290 340 -290 {
lab=pinA}
N 680 -220 740 -220 {
lab=pinY}
N 90 -290 120 -290 {
lab=inA}
N 890 -220 940 -220 {
lab=outY}
N 80 -90 110 -90 {
lab=inB}
N 560 -290 580 -290 {
lab=VDD}
N 580 -320 580 -290 {
lab=VDD}
N 560 -320 580 -320 {
lab=VDD}
N 680 -290 700 -290 {
lab=VDD}
N 700 -320 700 -290 {
lab=VDD}
N 680 -320 700 -320 {
lab=VDD}
N 560 -260 680 -260 {
lab=pinY}
N 680 -260 680 -220 {
lab=pinY}
N 520 -290 520 -220 {
lab=pinA}
N 620 -290 620 -140 {
lab=#net1}
N 620 -290 640 -290 {
lab=#net1}
N 680 -110 680 -90 {
lab=#net2}
N 680 -220 680 -170 {
lab=pinY}
N 680 -140 700 -140 {
lab=GND}
N 700 -140 700 -60 {
lab=GND}
N 680 -60 700 -60 {
lab=GND}
N 700 -60 700 -30 {
lab=GND}
N 680 -30 700 -30 {
lab=GND}
N 520 -220 520 -60 {
lab=pinA}
N 520 -60 640 -60 {
lab=pinA}
N 620 -140 640 -140 {
lab=#net1}
N 430 -120 450 -120 {
lab=VDD}
N 430 -60 450 -60 {
lab=GND}
N 450 -150 450 -120 {
lab=VDD}
N 430 -150 450 -150 {
lab=VDD}
N 450 -60 450 -30 {
lab=GND}
N 430 -30 450 -30 {
lab=GND}
N 590 -140 620 -140 {
lab=#net1}
N 270 -90 330 -90 {
lab=pinB}
N 390 -120 390 -60 {
lab=pinB}
N 340 -290 520 -290 {
lab=pinA}
N 430 -90 590 -90 {
lab=#net1}
N 590 -140 590 -90 {
lab=#net1}
N 330 -90 390 -90 {
lab=pinB}
C {devices/code.sym} 50 -480 0 0 {name=ngspice
only_toplevel=false
value="
VA inA 0 dc 0
VB inB 0 dc 0
VD VDD 0 dc 1.8
.control
alter @va[PULSE] [ 0 1.8 1n 40p 40p 1n 3n ]
alter @vb[PULSE] [ 0 0 1n 40p 40p 1n 3n ]
tran 10p 3n
meas tran  in1 FIND time WHEN v(pina)=0.9 RISE=1 > NUL
meas tran out1 FIND time WHEN v(piny)=0.9 FALL=1 > NUL
meas tran  in2 FIND time WHEN v(pina)=0.9 FALL=1 > NUL
meas tran out2 FIND time WHEN v(piny)=0.9 RISE=1 > NUL

let calc1 = out1 - in1
set delaynab1 = $&calc1
let calc2 = out2 - in2
set delaynab2 = $&calc2

alter @vb[PULSE] [ 0 1.8 1n 40p 40p 1n 3n ]
alter @va[PULSE] [ 1.8 1.8 1n 40p 40p 1n 3n ]
tran 10p 3n
meas tran  in5 FIND time WHEN v(pinb)=0.9 RISE=1 > NUL
meas tran out5 FIND time WHEN v(piny)=0.9 RISE=1 > NUL
meas tran  in6 FIND time WHEN v(pinb)=0.9 FALL=1 > NUL
meas tran out6 FIND time WHEN v(piny)=0.9 FALL=1 > NUL

let calc5 = out5 - in5
set delaynab5 = $&calc5
let calc6 = out6 - in6
set delaynab6 = $&calc6

let calc5 = out5 - in5
set delayna5 = $&calc5
let calc6 = out6 - in6
set delayna6 = $&calc6

echo '*** NANDB DELAY CASE 1 ***'
echo 'A(LH) when B(H) ='\{$delaynab1\}
echo 'A(HL) when B(H) ='\{$delaynab2\}

echo '*** NANDB DELAY CASE 2 ***'
echo 'B(LH) when A(H) ='\{$delaynab5\}
echo 'B(HL) when A(H) ='\{$delaynab6\}

.endc"}
C {devices/ipin.sym} 90 -290 0 0 {name=p10 lab=inA}
C {devices/opin.sym} 940 -220 0 0 {name=p4 lab=outY}
C {devices/lab_wire.sym} 320 -290 0 0 {name=p1 sig_type=std_logic lab=pinA}
C {devices/lab_wire.sym} 720 -220 0 0 {name=p2 sig_type=std_logic lab=pinY}
C {inverter.sym} 160 -290 0 0 {name=x1}
C {inverter.sym} 240 -290 0 0 {name=x2}
C {inverter.sym} 780 -220 0 0 {name=x4}
C {inverter.sym} 860 -220 0 0 {name=x5}
C {devices/ipin.sym} 80 -90 0 0 {name=p3 lab=inB}
C {devices/lab_wire.sym} 310 -90 0 0 {name=p5 sig_type=std_logic lab=pinB}
C {inverter.sym} 150 -90 0 0 {name=x3}
C {inverter.sym} 230 -90 0 0 {name=x6}
C {devices/vdd.sym} 560 -320 0 0 {name=l1 lab=VDD}
C {devices/vdd.sym} 680 -320 0 0 {name=l2 lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 540 -290 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} 660 -290 0 0 {name=M2
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
C {sky130_fd_pr/nfet_01v8.sym} 660 -140 0 0 {name=M3
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
C {sky130_fd_pr/nfet_01v8.sym} 660 -60 0 0 {name=M4
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
C {devices/gnd.sym} 680 -30 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/pfet_01v8.sym} 410 -120 0 0 {name=M5
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
C {sky130_fd_pr/nfet_01v8.sym} 410 -60 0 0 {name=M6
L=0.15
W=1
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
C {devices/gnd.sym} 430 -30 0 0 {name=l4 lab=GND}
C {devices/vdd.sym} 430 -150 0 0 {name=l5 lab=VDD}
C {devices/code.sym} 190 -480 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
