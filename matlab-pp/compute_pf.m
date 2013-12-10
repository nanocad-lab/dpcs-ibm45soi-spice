function [pf_cell, pf_byte, pf_halfword, pf_word, pf_doubleword, pf_64Bblock] = compute_pf(means, sigmas, s, n)

for i = 1 : n
    pf_cell(i) = 0.75 * erfc((means(i) - s) / (sqrt(2)*sigmas(i)));
    pf_byte(i) = 1-((1-pf_cell(i))^8);
    pf_halfword(i) = 1-((1-pf_cell(i))^16);
    pf_word(i) = 1-((1-pf_cell(i))^32);
    pf_doubleword(i) = 1-((1-pf_cell(i))^64);
    pf_64Bblock(i) = 1-((1-pf_cell(i))^512);
end