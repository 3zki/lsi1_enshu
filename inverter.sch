v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 140 -280 140 -260 {
lab=VDD}
N 140 -260 140 -240 {
lab=VDD}
N 140 -180 140 -120 {
lab=Y}
N 140 -60 140 -40 {
lab=GND}
N 140 -40 140 -20 {
lab=GND}
N 100 -210 100 -90 {
lab=A}
N 140 -210 160 -210 {
lab=VDD}
N 140 -90 160 -90 {
lab=GND}
N 160 -250 160 -210 {
lab=VDD}
N 160 -90 160 -50 {
lab=GND}
N 140 -250 160 -250 {
lab=VDD}
N 140 -50 160 -50 {
lab=GND}
N 140 -150 180 -150 {
lab=Y}
N 60 -150 100 -150 {
lab=A}
C {sky130_fd_pr/pfet_01v8.sym} 120 -210 0 0 {name=M1
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
C {sky130_fd_pr/nfet_01v8.sym} 120 -90 0 0 {name=M2
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
C {devices/gnd.sym} 140 -20 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} 140 -280 0 0 {name=l1 lab=VDD}
C {devices/ipin.sym} 60 -150 0 0 {name=p10 lab=A}
C {devices/opin.sym} 180 -150 0 0 {name=p4 lab=Y}
