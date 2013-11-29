echo "Running HSPICE..."

hspice hvtnfet_on.sp -o out/hvtnfet_on
hspice hvtnfet_off.sp -o out/hvtnfet_off
hspice rvtnfet_on.sp -o out/rvtnfet_on
hspice rvtnfet_off.sp -o out/rvtnfet_off
hspice lvtnfet_on.sp -o out/lvtnfet_on
hspice lvtnfet_off.sp -o out/lvtnfet_off

hspice hvtpfet_on.sp -o out/hvtpfet_on
hspice hvtpfet_off.sp -o out/hvtpfet_off
hspice rvtpfet_on.sp -o out/rvtpfet_on
hspice rvtpfet_off.sp -o out/rvtpfet_off
hspice lvtpfet_on.sp -o out/lvtpfet_on
hspice lvtpfet_off.sp -o out/lvtpfet_off

echo "Post-processing..."
perl pp.perl out/hvtnfet_on.lis 101 > out/hvtnfet_on.csv 
perl pp.perl out/hvtnfet_off.lis 101 > out/hvtnfet_off.csv 
perl pp.perl out/rvtnfet_on.lis 101 > out/rvtnfet_on.csv 
perl pp.perl out/rvtnfet_off.lis 101 > out/rvtnfet_off.csv 
perl pp.perl out/lvtnfet_on.lis 101 > out/lvtnfet_on.csv 
perl pp.perl out/lvtnfet_off.lis 101 > out/lvtnfet_off.csv 

perl pp.perl out/hvtpfet_on.lis 101 > out/hvtpfet_on.csv 
perl pp.perl out/hvtpfet_off.lis 101 > out/hvtpfet_off.csv 
perl pp.perl out/rvtpfet_on.lis 101 > out/rvtpfet_on.csv 
perl pp.perl out/rvtpfet_off.lis 101 > out/rvtpfet_off.csv 
perl pp.perl out/lvtpfet_on.lis 101 > out/lvtpfet_on.csv 
perl pp.perl out/lvtpfet_off.lis 101 > out/lvtpfet_off.csv 

echo "Done!"
