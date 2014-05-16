******* Author: Mark Gottscho <mgottscho@ucla.edu>
******* UCLA NanoCAD Lab (www.nanocad.ee.ucla.edu)


********* INCLUDE IBM MODELS
.inc '/w/library/puneet/IBM/IBM_CMOS/12S0_45_nm_SOI_CMOS/IBM_PDK/soi12s0/V1.5.0.0IBM/HSPICE/models/design.inc'
*.inc '/w/library/puneet/IBM/IBM_CMOS/12S0_45_nm_SOI_CMOS/IBM_PDK/soi12s0/V1.5.0.0IBM/HSPICE/models/skewParams.inc'
*.lib '/w/library/puneet/IBM/IBM_CMOS/12S0_45_nm_SOI_CMOS/IBM_PDK/soi12s0/V1.5.0.0IBM/HSPICE/models/include_all.lib'
*.prot
*.inc '/w/design/puneet/projects/liangzhen/hspice/models/ibm/models/design.inc.local'
*.unprot

.param SIGMA=0.0 $ for IBM models


******** param
.param VDD_VAL=1.0
.param W=67.5n
.param L=45n

****** VOLTAGE SOURCES
v_vdd	vdd	0	VDD_VAL 

r1		vdd inter 0.00001
x_n1	inter	0 0	0 d_srpdlnfet	w=W	l=L as=0 ad=0 ps=W pd=W

****** ANALYSIS
.options accurate

* Sweep vdd and read current 
.dc	v_vdd	START=0	STOP=VDD_VAL	STEP=0.01
.probe DC I(r1)
.print I(r1)
.plot I(r1)
.option ingold=2

.end
