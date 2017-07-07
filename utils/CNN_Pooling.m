function DataOut=CNN_Pooling(DataIn,method)

    jmax=size(DataIn,2);
    J_st=[1:2:jmax];
    J_End=J_st+2;
    ValidIdx= (J_End<=size(DataIn,2)) & (J_st<=size(DataIn,2));
    J_st=J_st(ValidIdx);
    J_End=J_End(ValidIdx);
    DataOut=zeros(1,numel(J_st),size(DataIn,3),'single');

    if strcmp(method,'max')
        for i=1:size(DataIn,3)
            for jj=1:length(J_st)
                tmpBlock=DataIn(1,J_st(jj):J_End(jj),i);
                DataOut(1,jj,i)=max(tmpBlock(:));
            end
        end
    else
        for i=1:size(DataIn,3)
            for jj=1:length(J_st)
                tmpBlock=DataIn(1,J_st(jj):J_End(jj),i);
                DataOut(1,jj,i)=mean(tmpBlock(:));
            end
        end
    end

end