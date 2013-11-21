******* 6T SRAM in IBM 45nm SOI for MC analysis
******* Author: Mark Gottscho <mgottscho@ucla.edu>
******* UCLA NanoCAD Lab (www.nanocad.ee.ucla.edu)


********* INCLUDE IBM MODELS
*.inc '/w/library/puneet/IBM/IBM_CMOS/12S0_45_nm_SOI_CMOS/IBM_PDK/soi12s0/V1.5.0.0IBM/HSPICE/models/skewParams.inc'
*.lib '/w/library/puneet/IBM/IBM_CMOS/12S0_45_nm_SOI_CMOS/IBM_PDK/soi12s0/V1.5.0.0IBM/HSPICE/models/include_all.lib'
.prot
.inc '/w/design/puneet/projects/liangzhen/hspice/models/ibm/models/design.inc.local'
.unprot

.param SIGMA=0.0 $ for IBM models


******** param
.param VDD_VAL=1.0
.param VSS_VAL=0.0
.param W_NMOS=180n
.param W_ACCESS=120n
.param W_PMOS=120n
.param L_NMOS=45n
.param L_ACCESS=45n
.param L_PMOS=45n


****** VOLTAGE SOURCES
v_vdd	vdd	vss	VDD_VAL 
v_vss	vss	0	VSS_VAL
v_in	Q	vss	VSS_VAL 
v_WL	WL	vss	VSS_VAL 
v_BL	BL	vss	VDD_VAL	
v_BL_b	BL_b	vss	VDD_VAL

****** 6T SRAM subcircuit
*.subckt sram6t	BL	BL_b	WL

x_n1	Q	Q_b	vss	vss	d_nfet	w=W_NMOS	l=L_NMOS	as=0	ad=0	ps=W_NMOS	pd=W_NMOS
x_p1	Q	Q_b	vdd	vdd	d_pfet	w=W_PMOS	l=L_PMOS	as=0	ad=0	ps=W_PMOS	pd=W_PMOS
x_a1	Q	WL	BL	vss	d_nfet	w=W_ACCESS	l=L_ACCESS	as=0	ad=0	ps=w_access	pd=W_ACCESS

x_n2	Q_b	Q	vss	vss	d_nfet	w=W_NMOS	l=L_NMOS	as=0	ad=0	ps=W_NMOS	pd=W_NMOS
x_p2	Q_b	Q	vdd	vdd	d_pfet	w=W_PMOS	l=L_PMOS	as=0	ad=0	ps=W_PMOS	pd=W_PMOS
x_a2	Q_b	WL	BL_b	vss	d_nfet	w=W_ACCESS	l=L_ACCESS	as=0	ad=0	ps=W_ACCESS	pd=W_ACCESS


*.ends

****** MAIN CIRCUIT
*sram_cell	bitline	bitline_b	wordline	sram6t

****** ANALYSIS
*.options accurate
*.options nomod
.option probe
.option post=CSDF

* Sweep Q and read Q_b
.dc	v_in	VSS_VAL	VDD_VAL	0.01 SWEEP MONTE=10
.probe DC V(Q_b)

*.alter
* Sweep Q_b and read Q
*v_in	Q_b	vss	VSS_VAL

.end
