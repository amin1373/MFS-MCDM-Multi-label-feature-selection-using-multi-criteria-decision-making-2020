function RC = Topsis(M,Redundancy,W)
%%%%%%%% step 1:normalization  %%%%%%%%%%%%%%%%%%
% M1=M.^2;
% M2=sqrt(sum(M1));
 [row column]=size(M);
% r=zeros(row,column);
% for i=1:row
%     for j=1:column
%         r(i,j)=M(i,j)/M2(j);%normalized decision matrix
%     end
% end
r = M;
%%%%%%%% step 2:Multiply Weighting  %%%%%%%%%%%%%%%%%%
w1=zeros(row,column);
for i=1:row
    for j=1:column
        w1(i,j)=r(i,j)*W(j);
    end
end 
%%%%%%%%%%
for i=1:row
    for j=1:column
        w1(i,j)=r(i,j)*Redundancy(i);
    end
end 
%%%%%%%% step 3:Find ideal & negative ideal  %%%%%%%%%%%%%%%%%%
ideal=max(w1);
nideal=min(w1);

%%%%%%%% step 4:Calculate seperation from ideal & negative ideal  %%%%%%%%%%%%%%%%%%
AP=zeros(row,column);
for i=1:row
    for j=1:column
        AP(i,j)=(w1(i,j)-ideal(j))^2;
    end
end
A1=sqrt(sum(AP, 2));
AN=zeros(row,column);
for i=1:row
    for j=1:column
        AN(i,j)=(w1(i,j)-nideal(j))^2;
    end
end
A2=sqrt(sum(AN, 2));
%%%%%%%% step 5:Calculate Relative Closness  %%%%%%%%%%%%%%%%%%
RC=zeros(1,row);
 for i=1:row
     RC(i)=A2(i)/(A1(i)+A2(i));
 end
 
end
