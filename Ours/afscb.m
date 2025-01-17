function [it,label,B] = afscb(label, K,S, P,B, p1,p2)
V=B;
D=diag(sum(S,2));
L=D-S;
n=size(L,1);
maxit = 1000;
last = zeros(n,1);
it=0;


while any(last~=label)&&it<=maxit
    last=label;
    % fixB updateY
    label=upY(label,K,S,P,B,p1);
    Y=label2binary(label);
    % fixY updateB
    U=Y*(Y'*Y)^-1*Y'*P;
    B=p1/(p1+p2)*U+p2/(p1+p2)*V;
  
    it=it+1; 
end



end
