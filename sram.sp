******* 6T SRAM in IBM 45nm SOI for MC analysis
******* Author: Mark Gottscho <mgottscho@ucla.edu>
******* UCLA NanoCAD Lab (www.nanocad.ee.ucla.edu)


********* INCLUDE IBM MODELS
*.inc '/w/library/puneet/IBM/IBM_CMOS/12S0_45_nm_SOI_CMOS/IBM_PDK/soi12s0/V1.5.0.0IBM/HSPICE/models/skewParams.inc'
*.lib '/w/library/puneet/IBM/IBM_CMOS/12S0_45_nm_SOI_CMOS/IBM_PDK/soi12s0/V1.5.0.0IBM/HSPICE/models/include_all.lib'
.prot
.inc '/w/design/puneet/projects/liangzhen/hspice/models/ibm/models/design.inc.local'
.unprot

.PARAM sigma=0.0


******** PARAMETERS
.PARAM vdd=1.0
.PARAM vss=0
.PARAM w_nmos=180n
.PARAM w_access=120n
.PARAM w_pmos=120n
.PARAM l_nmos=45n
.PARAM l_access=45n
.PARAM l_pmos=45n


****** VOLTAGE SOURCES
.GLOBAL vdd vss

vdd vdd 0 vdd
vss vss 0 0
V_Q Q vss dc=0

****** 6T SRAM subcircuit
*.subckt sram6t	BL	BL_bar	WL

x_n1	Q	Q_bar	vss	vss	d_nfet	w=w_nmos	l=l_nmos	as=0	ad=0	ps=w_nmos	pd=w_nmos
x_p1	Q	Q_bar	vdd	vdd	d_pfet	w=w_pmos	l=l_pmos	as=0	ad=0	ps=w_pmos	pd=w_pmos
x_a1	Q	WL	BL	vss	d_nfet	w=w_access	l=l_access	as=0	ad=0	ps=w_access	pd=w_access

x_n2	Q_bar	Q	vss	vss	d_nfet	w=w_nmos	l=l_nmos	as=0	ad=0	ps=w_nmos	pd=w_nmos
x_p2	Q_bar	Q	vdd	vdd	d_pfet	w=w_pmos	l=l_pmos	as=0	ad=0	ps=w_pmos	pd=w_pmos
x_a2	Q_bar	WL	BL_bar	vss	d_nfet	w=w_access	l=l_access	as=0	ad=0	ps=w_access	pd=w_access

*.ends

****** MAIN CIRCUIT
*sram_cell	bitline	bitline_bar	wordline	sram6t

****** ANALYSIS
.DC	V_Q	vss	vdd	0.01
.PRINT	V(Q_bar)
.PLOT V(Q_bar)

.op
.options accurate
.options nomod post


.end
