function Rst=CNN_Conv(DataIn,Weight_Ker,Weight_B,Stride)

    tmpZ=Mat_MulAdd(DataIn(:,:,1),Weight_Ker(:,:,1,1));
    tmp=tmpZ(1:Stride:end,1:Stride:end,:,:);
    Rst=zeros(size(tmp,1),size(tmp,2),size(Weight_Ker,4),'single');
    tmpData=zeros(size(tmp),'single');
    for i=1:size(Weight_Ker,4)
        tmpData=tmpData.*0;
        for j=1:size(Weight_Ker,3)
            Ker=Weight_Ker(:,:,j,i);
            DataConv=DataIn(:,:,j);
            %tmpConv=conv2(DataConv,Ker,'valid');
            tmpConvZ=Mat_MulAdd(DataConv,Ker);
            tmpConv=tmpConvZ(1:Stride:end,1:Stride:end,:,:);
            tmpData=tmpData+tmpConv;
        end
        Rst(:,:,i)=tmpData+Weight_B(i);
    end

end