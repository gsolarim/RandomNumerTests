clear all,clc
%Created by Gabriel Solari Morales
a=input('Ingrese el valor de (a) : ');   
m=input('Ingrese el valor de (m) : ');
x(1)=input('Ingrese el valor de (x) inicial : ');
n=input('Ingrese la cantidad de números que desea generar (n) : ');
c=input('Ingrese la cantidad de clases (c) : ');
alpha=input('Ingrese el nivel de significación (alfa) : ');
%fprintf("%d",x(1));
%alpha=1-alpha;
%grad=c-1;

fprintf('\n\n\n')
fprintf('       Semilla     |     Serie Generada  \n\n')

for i=2:n+1
    x(i)=mod(a*x(i-1),abs(m));
    fprintf("   %10d",x(i-1));
    fprintf("             %10d\n",x(i));
end

fprintf('\n\n\n')
fprintf(' Serie - (valores entre 0 y 1)  \n\n')

for z=1:n
    y(z)=x(z+1)/m;
    fprintf("           %5.5f\n",y(z));
end
esp=n/c;
l=length(y);
min=0;
h=(1-0)/c;
N(1)=0+h;
pos=find(y<N(1));
pos=length(pos);
error(1)=(esp-pos)^2/esp;
fprintf('                                  TABLA DE FRECUENCIAS  \n')
fprintf('              Intervalos         |  F.Observada   |  F.Esperada   |  Error \n')
fprintf('    %10.3f    -%10.3f    |  %7d       |  %7.4f      |  %5.4f\n',min,N(1),pos,esp,error(1))
for j=2:c
clearvars pos 
N(j)=N(j-1)+h;
pos=find(N(j-1)<y & y<N(j));
pos=length(pos);
error(j)=(esp-pos)^2/esp;
fprintf('    %10.3f    -%10.3f    |  %7d       |  %7.4f      |  %5.4f\n',N(j-1),N(j),pos,esp,error(j))
%fprintf('       |  %7.3f\n',esp)
end
errortotal=sum(error);
tolerancia=chi2inv(1-alpha,c-1);
fprintf('                 TOTAL           |  %7d            ERROR      |  %5.4f\n',l,errortotal)
fprintf('                                                     TOLERANCIA   |  %5.4f\n',tolerancia)