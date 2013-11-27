echo "Running HSPICE..."

hspice rvtnfet_on.sp -o out/rvtnfet_on
hspice rvtnfet_off.sp -o out/rvtnfet_off
hspice lvtnfet_on.sp -o out/lvtnfet_on
hspice lvtnfet_off.sp -o out/lvtnfet_off
hspice rvtpfet_on.sp -o out/rvtpfet_on
hspice rvtpfet_off.sp -o out/rvtpfet_off
hspice lvtpfet_on.sp -o out/lvtpfet_on
hspice lvtpfet_off.sp -o out/lvtpfet_off

echo "Post-processing..."
perl pp.perl out/rvtnfet_on.lis 101 > out/rvtnfet_on.csv 
perl pp.perl out/rvtnfet_off.lis 101 > out/rvtnfet_off.csv 
perl pp.perl out/lvtnfet_on.lis 101 > out/lvtnfet_on.csv 
perl pp.perl out/lvtnfet_on.lis 101 > out/lvtnfet_off.csv 
perl pp.perl out/rvtpfet_on.lis 101 > out/rvtpfet_on.csv 
perl pp.perl out/rvtpfet_off.lis 101 > out/rvtpfet_off.csv 
perl pp.perl out/lvtpfet_on.lis 101 > out/lvtpfet_on.csv 
perl pp.perl out/lvtpfet_on.lis 101 > out/lvtpfet_off.csv 

echo "Done!"
