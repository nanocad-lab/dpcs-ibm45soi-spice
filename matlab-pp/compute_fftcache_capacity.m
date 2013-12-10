function [P_fs, P_fb, P_lnf, P_lmf, P_ncb, P_ncfb, P_lnc, P_llc, P_lhc] = compute_fftcache_capacity(P_f, n, m, k, d, c, numVoltages)

% compute_fftcache_capacity
%
% P_f (cell failure probability)
% n (number of ways (blocks in a line))
% m (number of sets)
% k (number of sub-blocks in a block)
% d (number of bits in a sub-block)
% c (max global blocks per line (MGB))
% numVoltages (number of voltages tested)
%
% Retval: [P_fs, P_fb, P_lnf, P_lmf, P_ncb, P_ncfb, P_lnc, P_llc, P_lhc]

for i = 1 : numVoltages
   P_fs(i) = 1-(1-P_f(i))^d;
   P_fb(i) = 1-(1-P_fs(i))^k;
   P_lnf(i) = (1-P_fb(i))^n;
   P_lmf(i) = 0;
   for j = 1 : c
        P_lmf(i) = P_lmf(i) + factorial(n)/(factorial(j)*factorial(n-j)) * P_fb(i)^j * (1-P_fb(i))^(n-j);
   end
   
   P_ncb(i) = (1-P_fs(i)^2)^k;
   P_ncfb(i) = P_ncb(i) - (2*P_fb(i)*(1-P_fb(i))+(1-P_fb(i))^2);
   
   P_lnc(i) = 0;
   P_llc(i) = 0;
   P_lhc(i) = 0;
   for j = c+1 : n
      alpha = factorial(j)/(factorial(2)*factorial(j-2));
      P_lnc(i) = P_lnc(i) + factorial(n)/(factorial(j)*factorial(n-j)) * P_fb(i)^j * (1-P_fb(i))^(n-j) * P_ncfb(i)^alpha;
      P_llc(i) = P_llc(i) + factorial(n)/(factorial(j)*factorial(n-j)) * P_fb(i)^j * (1-P_fb(i))^(n-j) * P_ncfb(i)^(alpha-1) * (1-P_ncfb(i));
      
      lhc_val = 0;
      for x = 2 : alpha
        lhc_val = lhc_val + P_ncfb(i)^(alpha-x) * (1-P_ncfb(i))^x;
      end
      P_lhc(i) = P_llc(i) + factorial(n)/(factorial(j)*factorial(n-j)) * P_fb(i)^j * (1-P_fb(i))^(n-j) * lhc_val;
   end
   
   %alpha = factorial(n)/(factorial(2)*factorial(n-2));
   %P_nonconflict(i) = P_nonconflictblock(i)^alpha;
   %P_lowconflict(i) = factorial(n)/(factorial(1)*factorial(n-1)) * P_nonconflictblock(i)^(alpha-1) * (1-P_nonconflictblock(i));
   
   %P_highconflict(i) = 0;
   %for j = 2 : n
   %    P_highconflict(i) = P_highconflict(i) + factorial(n)/(factorial(j)*factorial(n-j)) * P_nonconflictblock(i)^(alpha-j) * (1-P_nonconflictblock(i))^j;
   %end
end