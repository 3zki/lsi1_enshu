v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 160 -300 220 -300 {
lab=B}
N 160 -320 220 -320 {
lab=A}
N 160 -280 220 -280 {
lab=C}
N 160 -260 220 -260 {
lab=D}
N 520 -320 560 -320 {
lab=Y}
C {devices/ipin.sym} 160 -320 0 0 {name=p1 lab=A}
C {devices/ipin.sym} 160 -300 0 0 {name=p2 lab=B}
C {devices/ipin.sym} 160 -280 0 0 {name=p3 lab=C}
C {devices/ipin.sym} 160 -260 0 0 {name=p4 lab=D}
C {devices/opin.sym} 560 -320 0 0 {name=p5 lab=Y}
C {devices/simulator_commands.sym} 190 -540 0 0 {name=SIMLATION
simulator=ngspice
only_toplevel=false 
value="
VP VDD 0 dc 1.8
VA A 0 pulse(1.8 0 0 40p 40p 10n 20n) dc 0
VB B 0 pulse(1.8 0 0 40p 40p 20n 40n) dc 0
VC C 0 pulse(1.8 0 0 40p 40p 40n 80n) dc 0
VD D 0 pulse(1.8 0 0 40p 40p 80n 160n) dc 0
.control
save all
tran 10p 160n
meas tran test1 FIND v(y) WHEN time=5n > NUL
meas tran test2 FIND v(y) WHEN time=15n > NUL
meas tran test3 FIND v(y) WHEN time=25n > NUL
meas tran test4 FIND v(y) WHEN time=35n > NUL
meas tran test5 FIND v(y) WHEN time=45n > NUL
meas tran test6 FIND v(y) WHEN time=55n > NUL
meas tran test7 FIND v(y) WHEN time=65n > NUL
meas tran test8 FIND v(y) WHEN time=75n > NUL
meas tran test9 FIND v(y) WHEN time=85n > NUL
meas tran testa FIND v(y) WHEN time=95n > NUL
meas tran testb FIND v(y) WHEN time=105n > NUL
meas tran testc FIND v(y) WHEN time=115n > NUL
meas tran testd FIND v(y) WHEN time=125n > NUL
meas tran teste FIND v(y) WHEN time=135n > NUL
meas tran testf FIND v(y) WHEN time=145n > NUL
meas tran testg FIND v(y) WHEN time=155n > NUL
echo '*** TEST ***'
echo '-D-C-B-A-Y-'
echo -n '-L-L-L-L-'
if test1 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-L-L-L-H-'
if test2 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-L-L-H-L-'
if test3 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-L-L-H-H-'
if test4 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-L-H-L-L-'
if test5 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-L-H-L-H-'
if test6 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-L-H-H-L-'
if test7 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-L-H-H-H-'
if test8 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-H-L-L-L-'
if test9 >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-H-L-L-H-'
if testa >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-H-L-H-L-'
if testb >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-H-L-H-H-'
if testc >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-H-H-L-L-'
if testd >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-H-H-L-H-'
if teste >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-H-H-H-L-'
if testf >= 0.9
  echo 'H-'
else
  echo 'L-'
end
echo -n '-H-H-H-H-'
if testg >= 0.9
  echo 'H-'
else
  echo 'L-'
end
.endc
"}
C {devices/code.sym} 50 -540 0 0 {name=TT_MODELS
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
C {1g99.sym} 370 -290 0 0 {name=x1}
