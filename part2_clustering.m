% import R0.mat first
% calculating fuzzy tolerance relation R1
for i=1:16
    for j=1:16
        p1=0;
        p2=0;
        p3=0;
        for k=1:4
            p1=p1+abs(R0(i,k)*R0(j,k));
            p2=p2+R0(i,k)*R0(i,k);
            p3=p3+R0(j,k)*R0(j,k);
        end
        R1(i,j)=p1/sqrt(p2*p3);
    end
end
% calculating fuzzy equivalence relation R
Rx=R1;
R2=fuzzycomposition(Rx,Rx);
while isequal(Rx,R2)==0
    Rx=R2;
    R2=fuzzycomposition(Rx,Rx);
end
% apply a-cut
R3=acut(R2,0.85);
function [R]=fuzzycomposition(A,B)
% fuzzy composition
[m,n]=size(A);[q,p]=size(B);
if n~=q
    disp('error');
else
    R=zeros(m,p);
for k =1:m    
    for j=1:p
        temp=[];
        for i =1:n
            Min = min(A(k,i),B(i,j)); 
            temp=[temp Min]; 
        end
        R(k,j)=max(temp);
    end
end
end
end
function [R]=acut(A,a)
% a-cut
[m,n]=size(A);
R=zeros(m,n);
for i=1:m
    for j=1:n
        if A(i,j)<a
            R(i,j)=0;
        else 
            R(i,j)=1;
        end
    end
end
end
