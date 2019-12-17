function [T_AMBE,T_PSNR,T_SSI,T_ENTROPY] = comparison_table

[file,t_ambe,t_psnr,t_ssi,t_entropy] = comparison_main();
IMAGES = char(file);

%ambe table
HE = t_ambe(:,1);
BBHE = t_ambe(:,2);
MMBEBHE = t_ambe(:,3);
DSIHE = t_ambe(:,4);
RMSHE = t_ambe(:,5);
RSIHE = t_ambe(:,6);
RSWHE_M = t_ambe(:,7);
RSWHE_D = t_ambe(:,8);
T_AMBE = table(IMAGES,HE,BBHE,MMBEBHE,DSIHE,RMSHE,RSIHE,RSWHE_M,RSWHE_D);
writetable(T_AMBE,'comp_ambe.csv');
writetable(T_AMBE,'comp_ambe.xlsx');
writetable(T_AMBE,'comp_ambe.txt');

%psnr table
HE = t_psnr(:,1);
BBHE = t_psnr(:,2);
MMBEBHE = t_psnr(:,3);
DSIHE = t_psnr(:,4);
RMSHE = t_psnr(:,5);
RSIHE = t_psnr(:,6);
RSWHE_M = t_psnr(:,7);
RSWHE_D = t_psnr(:,8);
T_PSNR = table(IMAGES,HE,BBHE,MMBEBHE,DSIHE,RMSHE,RSIHE,RSWHE_M,RSWHE_D);
writetable(T_PSNR,'comp_psnr.csv');
writetable(T_PSNR,'comp_psnr.xlsx');
writetable(T_PSNR,'comp_psnr.txt');

%ssi table
HE = t_ssi(:,1);
BBHE = t_ssi(:,2);
MMBEBHE = t_ssi(:,3);
DSIHE = t_ssi(:,4);
RMSHE = t_ssi(:,5);
RSIHE = t_ssi(:,6);
RSWHE_M = t_ssi(:,7);
RSWHE_D = t_ssi(:,8);
T_SSI= table(IMAGES,HE,BBHE,MMBEBHE,DSIHE,RMSHE,RSIHE,RSWHE_M,RSWHE_D);
writetable(T_SSI,'comp_ssi.csv');
writetable(T_SSI,'comp_ssi.xlsx');
writetable(T_SSI,'comp_ssi.txt');

%entropy table
HE = t_entropy(:,1);
BBHE = t_entropy(:,2);
MMBEBHE = t_entropy(:,3);
DSIHE = t_entropy(:,4);
RMSHE = t_entropy(:,5);
RSIHE = t_entropy(:,6);
RSWHE_M = t_entropy(:,7);
RSWHE_D = t_entropy(:,8);
T_ENTROPY = table(IMAGES,HE,BBHE,MMBEBHE,DSIHE,RMSHE,RSIHE,RSWHE_M,RSWHE_D);
writetable(T_ENTROPY,'comp_entropy.csv');
writetable(T_ENTROPY,'comp_entropy.xlsx');
writetable(T_ENTROPY,'comp_entropy.txt');

end