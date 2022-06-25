clear all, clc
%Created by Gabriel Solari Morales
a=input('Ingrese el valor de (a) : ');   
m=input('Ingrese el valor de (m) : ');
x(1)=input('Ingrese el valor de (x) inicial : ');
n=input('Ingrese la cantidad de números que desea generar (n) : ');
alpha=input('Ingrese el nivel de significación (alfa) : ');

fprintf('\n\n\n')
fprintf('       Semilla     |     Serie Generada  \n\n')

for i=2:n+1
    x(i)=mod(a*x(i-1),abs(m));
    fprintf("   %10d",x(i-1));
    fprintf("             %10d\n",x(i));
end

fprintf('\n\n\n')
fprintf(' Serie - (valores entre 0 y 1) \n\n')

for z=1:n
    y(z)=x(z+1)/m;
    fprintf("            %5.5f\n",y(z));
end
ordena=sort(y);
fprintf('\n\n\n')
fprintf('       i   |   Ordenado   |    i/n       |   E. de Prueba  \n\n')
for z=1:n
    div(z)=z/n;
    prueba(z)=abs(div(z)-ordena(z));
    fprintf("   %5d   |   %5.5f    |   %5.5f    |   %5.5f\n",z,ordena(z),div(z),prueba(z));
end
D=max(prueba);
[h,p,k,c]=kstest(ordena,[],0.05,0);
d=c;
fprintf('                            ERROR        |   %6.5f\n',D)
fprintf('                            TOLERANCIA   |   %6.5f\n',d)
