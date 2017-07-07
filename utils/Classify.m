function ClassOut=Classify(Data_ch1,Data_ch2)

load model
DataLenth=1200;

%Data preparation
MinLen=min(length(Data_ch1),length(Data_ch2));
MinLen=min(MinLen,DataLenth);
DataIn=zeros(1,DataLenth,2,1);
DataIn(:,:,1,1)=Data_ch1(1:MinLen)';
DataIn(:,:,2,1)=Data_ch2(1:MinLen)';
DataIn(isnan(DataIn))=0;
DataIn(:,:,1,:)=DataIn(:,:,1,:)-dataMean(1);
DataIn(:,:,2,:)=DataIn(:,:,2,:)-dataMean(2);

%Creat memory
n = numel(net.layers);
res = struct('x', cell(1,n+1)) ;
res(1).x = single(DataIn);

%CNN
for i=1:n
  l = net.layers{i} ;
  switch l.type
    case 'conv'
      res(i+1).x = CNN_Conv(res(i).x,l.weights{1},l.weights{2},l.stride);
      
    case 'pool'
      res(i+1).x = CNN_Pooling(res(i).x, l.method);
      
    case 'softmaxloss'
      Xc=reshape(res(i).x,[size(res(i).x,3),size(res(i).x,4)]);
      [~,ClassIdx]=max(Xc,[],1);
      ClassOut=Type{ClassIdx};
      
    case 'dropout'
        res(i+1).x = res(i).x ;
        
    case 'relu'
      res(i+1).x = max(res(i).x,0) ;
      
    otherwise
      error('Unknown layer type ''%s''.', l.type) ;
  end
end

end