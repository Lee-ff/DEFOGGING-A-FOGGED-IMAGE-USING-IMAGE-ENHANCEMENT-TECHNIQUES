function [t_ambe,t_psnr,t_ssi,t_entropy] = comparison_all(infile)

t_ambe = comparison_ambe(infile);
t_psnr = comparison_psnr(infile);
t_ssi = comparison_ssi(infile);
t_entropy = comparison_entropy(infile);

end