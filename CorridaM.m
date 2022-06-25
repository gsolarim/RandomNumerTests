clear all,clc
%Created by Gabriel Solari Morales
a=input('Ingrese el valor de (a) : ');   
m=input('Ingrese el valor de (m) : ');
x(1)=input('Ingrese el valor de (x) inicial : ');
n=input('Ingrese la cantidad de números que desea generar (n) : ');
alpha=input('Ingrese el nivel de significación (alfa) : ');

j = 1;
w(j) = 1;

o = 1;
v(o) = 1;

fprintf('\n\n\n')
fprintf('       Semilla     |     Serie Generada  \n\n')

for i=2:n+1
    x(i)=mod(a*x(i-1),abs(m));
    fprintf("   %10d",x(i-1));
    fprintf("             %10d\n",x(i));
end

fprintf('\n\n\n')
fprintf(' Serie - (valores entre 0 y 1) |    Corridas \n\n')

for z=1:n
    y(z)=x(z+1)/m;
    fprintf("            %5.5f            |    ",y(z));
    if y(z)>0.5
    t(z)=1;
    else
    t(z)=0;
    end   
    fprintf("%5d\n",t(z));

end
for c = 1 : length(t)-1
    if t(c+1)== t(c)
    w(j) = w(j)+1;
    else
    j = j+1;
    w(j) = 1;
    end
end
rachas=w;
fprintf('\n\n\n')
fprintf('       Rachas \n\n')
fprintf(' %10d \n',rachas)

corridas=length(rachas);
vu=unique(t,'stable');

for c=1:length(vu)
    m=vu(c);
    nv(c)=length( find(t==vu(c)));
end

if t(1)==1
    n1=nv(1);
    n2=nv(2);
else 
    n1=nv(2);
    n2=nv(1);
end 
aceptacion=abs(norminv(alpha/2));
N=n1+n2;
mu=((2*n1*n2)/(N))+0.5;
sigma=sqrt(((2*n1*n2)*(2*n1*n2-N))/(N^2*(N-1)));
z=abs((corridas-mu)/sigma);


fprintf('\n\n\n')
fprintf('     Corridas                         :  %5d \n',corridas)
fprintf('     Numero de Signos positivos       :  %5d \n',n1)
fprintf('     Numero de Signos negativos       :  %5d \n',n2)

fprintf('\n\n\n')
fprintf('     mu       :  %5.2f \n',mu)
fprintf('     sigma    :  %5.3f \n',sigma)
fprintf('     Z        :  %5.3f \n',z)
fprintf('     Límite   :  %5.3f \n',aceptacion)
