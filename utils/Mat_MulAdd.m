function RstR=Mat_MulAdd(DataVal,Ker)
%Ker=fliplr(flipud(Ker));
% Ker=rot90(Ker,2);
% RstR=conv2(DataVal,Ker);
% RstR=RstR(size(Ker,1):size(RstR,1)-size(Ker,1)+1,size(Ker,2):size(RstR,2)-size(Ker,2)+1);
Ker=rot90(Ker,2);
RstR=conv2(DataVal,Ker,'valid');
end