#!/bin/bash
# 
# Author: Mark Gottscho
# mgottscho@ucla.edu
#
# Automate HSPICE runs to get basic I-V characteristics
# for various HVT, RVT, LVT MOSFET models in both
# on and off conditions as voltage is scaled.

echo "Running HSPICE..."

mkdir out

# HVTNFET
hspice hvtnfet_on.sp -o out/hvtnfet_on
hspice hvtnfet_off.sp -o out/hvtnfet_off
# HVTPFET
hspice hvtpfet_on.sp -o out/hvtpfet_on
hspice hvtpfet_off.sp -o out/hvtpfet_off

# RVTNFET
hspice rvtnfet_on.sp -o out/rvtnfet_on
hspice rvtnfet_off.sp -o out/rvtnfet_off
# RVTPFET
hspice rvtpfet_on.sp -o out/rvtpfet_on
hspice rvtpfet_off.sp -o out/rvtpfet_off

# LVTNFET
hspice lvtnfet_on.sp -o out/lvtnfet_on
hspice lvtnfet_off.sp -o out/lvtnfet_off
# LVTPFET
hspice lvtpfet_on.sp -o out/lvtpfet_on
hspice lvtpfet_off.sp -o out/lvtpfet_off

# SRPDANFET (SRAM pull-down NFET, P404 Cell A)
hspice srpdanfet_on.sp -o out/srpdanfet_on
hspice srpdanfet_off.sp -o out/srpdanfet_off
# SRPGANFET (SRAM pass-gate NFET, P404 Cell A)
hspice srpganfet_on.sp -o out/srpganfet_on
hspice srpganfet_off.sp -o out/srpganfet_off
# SRPUAPFET (SRAM pull-up PFET, P404 Cell A)
hspice srpuapfet_on.sp -o out/srpuapfet_on
hspice srpuapfet_off.sp -o out/srpuapfet_off

# SRPDBNFET (SRAM pull-down NFET, G404 Cell B)
hspice srpdbnfet_on.sp -o out/srpdbnfet_on
hspice srpdbnfet_off.sp -o out/srpdbnfet_off
# SRPGBNFET (SRAM pass-gate NFET, G404 Cell B)
hspice srpgbnfet_on.sp -o out/srpgbnfet_on
hspice srpgbnfet_off.sp -o out/srpgbnfet_off
# SRPUBPFET (SRAM pull-up PFET, G404 Cell B)
hspice srpubpfet_on.sp -o out/srpubpfet_on
hspice srpubpfet_off.sp -o out/srpubpfet_off

# SRPDCNFET (SRAM pull-down NFET, S462 Cell C)
hspice srpdcnfet_on.sp -o out/srpdcnfet_on
hspice srpdcnfet_off.sp -o out/srpdcnfet_off
# SRPGCNFET (SRAM pass-gate NFET, S462 Cell C)
hspice srpgcnfet_on.sp -o out/srpgcnfet_on
hspice srpgcnfet_off.sp -o out/srpgcnfet_off
# SRPUCPFET (SRAM pull-up PFET, S462 Cell C)
hspice srpucpfet_on.sp -o out/srpucpfet_on
hspice srpucpfet_off.sp -o out/srpucpfet_off

# SRPDLNFET (SRAM pull-down NFET, F404 Cell L)
hspice srpdlnfet_on.sp -o out/srpdlnfet_on
hspice srpdlnfet_off.sp -o out/srpdlnfet_off
# SRPGLNFET (SRAM pass-gate NFET, F404 Cell L)
hspice srpglnfet_on.sp -o out/srpglnfet_on
hspice srpglnfet_off.sp -o out/srpglnfet_off
# SRPULPFET (SRAM pull-up PFET, F404 Cell L)
hspice srpulpfet_on.sp -o out/srpulpfet_on
hspice srpulpfet_off.sp -o out/srpulpfet_off

echo "Post-processing..."

# HVTNFET
perl post-process.perl out/hvtnfet_on.lis 101 > out/hvtnfet_on.csv 
perl post-process.perl out/hvtnfet_off.lis 101 > out/hvtnfet_off.csv 
# HVTPFET
perl post-process.perl out/hvtpfet_on.lis 101 > out/hvtpfet_on.csv 
perl post-process.perl out/hvtpfet_off.lis 101 > out/hvtpfet_off.csv 

# RVTNFET
perl post-process.perl out/rvtnfet_on.lis 101 > out/rvtnfet_on.csv 
perl post-process.perl out/rvtnfet_off.lis 101 > out/rvtnfet_off.csv 
# RVTPFET
perl post-process.perl out/rvtpfet_on.lis 101 > out/rvtpfet_on.csv 
perl post-process.perl out/rvtpfet_off.lis 101 > out/rvtpfet_off.csv 

# LVTNFET
perl post-process.perl out/lvtnfet_on.lis 101 > out/lvtnfet_on.csv 
perl post-process.perl out/lvtnfet_off.lis 101 > out/lvtnfet_off.csv 
# LVTPFET
perl post-process.perl out/lvtpfet_on.lis 101 > out/lvtpfet_on.csv 
perl post-process.perl out/lvtpfet_off.lis 101 > out/lvtpfet_off.csv 

# SRPDANFET
perl post-process.perl out/srpdanfet_on.lis 101 > out/srpdanfet_on.csv 
perl post-process.perl out/srpdanfet_off.lis 101 > out/srpdanfet_off.csv 
# SRPGANFET
perl post-process.perl out/srpganfet_on.lis 101 > out/srpganfet_on.csv 
perl post-process.perl out/srpganfet_off.lis 101 > out/srpganfet_off.csv 
# SRPUAPFET
perl post-process.perl out/srpuapfet_on.lis 101 > out/srpuapfet_on.csv 
perl post-process.perl out/srpuapfet_off.lis 101 > out/srpuapfet_off.csv 

# SRPDBNFET
perl post-process.perl out/srpdbnfet_on.lis 101 > out/srpdbnfet_on.csv 
perl post-process.perl out/srpdbnfet_off.lis 101 > out/srpdbnfet_off.csv 
# SRPGBNFET
perl post-process.perl out/srpgbnfet_on.lis 101 > out/srpgbnfet_on.csv 
perl post-process.perl out/srpgbnfet_off.lis 101 > out/srpgbnfet_off.csv 
# SRPUBPFET
perl post-process.perl out/srpubpfet_on.lis 101 > out/srpubpfet_on.csv 
perl post-process.perl out/srpubpfet_off.lis 101 > out/srpubpfet_off.csv 

# SRPDCNFET
perl post-process.perl out/srpdcnfet_on.lis 101 > out/srpdcnfet_on.csv 
perl post-process.perl out/srpdcnfet_off.lis 101 > out/srpdcnfet_off.csv 
# SRPGCNFET
perl post-process.perl out/srpgcnfet_on.lis 101 > out/srpgcnfet_on.csv 
perl post-process.perl out/srpgcnfet_off.lis 101 > out/srpgcnfet_off.csv 
# SRPUCPFET
perl post-process.perl out/srpucpfet_on.lis 101 > out/srpucpfet_on.csv 
perl post-process.perl out/srpucpfet_off.lis 101 > out/srpucpfet_off.csv 

# SRPDLNFET
perl post-process.perl out/srpdlnfet_on.lis 101 > out/srpdlnfet_on.csv 
perl post-process.perl out/srpdlnfet_off.lis 101 > out/srpdlnfet_off.csv 
# SRPGLNFET
perl post-process.perl out/srpglnfet_on.lis 101 > out/srpglnfet_on.csv 
perl post-process.perl out/srpglnfet_off.lis 101 > out/srpglnfet_off.csv 
# SRPULPFET
perl post-process.perl out/srpulpfet_on.lis 101 > out/srpulpfet_on.csv 
perl post-process.perl out/srpulpfet_off.lis 101 > out/srpulpfet_off.csv 

echo "Done!"
