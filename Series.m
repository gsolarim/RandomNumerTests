clear all, clc
%Created by Gabriel Solari Morales
a=input('Ingrese el valor de (a) : ');   
m=input('Ingrese el valor de (m) : ');
k(1)=input('Ingrese el valor de (x) inicial : ');
n=input('Ingrese la cantidad de números que desea generar (n) : ');
in=input('Ingrese la cantidad de intervalos (in) : ');
alpha=input('Ingrese el nivel de significación (alfa) : ');

F=1:1:in^2;
F=transpose(F);
fprintf('\n\n\n')
fprintf('       Semilla     |     Serie Generada  \n\n')

for i=2:n+1
    k(i)=mod(a*k(i-1),abs(m));
    fprintf("   %10d",k(i-1));
    fprintf("             %10d\n",k(i));
end

fprintf('\n\n\n')
fprintf('        Coordenada X    |    Coordenada Y \n\n')

for z=1:n-1
    x(z)=k(z+1)/m;
    fprintf("            %5.5f",x(z));
    y(z)=k(z+2)/m;
    fprintf("     |      %5.5f\n",y(z));
    contador1(z)=x(z)*in;
    contador2(z)=y(z)*in;
    posicion1(z)=ceil(contador1(z));
    posicion2(z)=ceil(contador2(z));
   % if posicion1(z)==posicion2(z)==1
   % cuenta(z)=1;
   % elseif posicion1(z)==posicion2(z)==in
   % cuenta(z)=in^2;
   % elseif posicion1(z)==1 && posicion2(z)==in
   % cuenta(z)=in;
   % elseif posicion1z)==in && posicion2(z)==1
   % cuenta(z)=in*(in-1)+1;
    
end

cuenta=1:1:in;
for w=1:in-1
for f=min(cuenta):max(cuenta)
cuenta=[cuenta f] ;
end
end

A=[posicion1;posicion2];
B=[sort(cuenta);cuenta];
A=transpose(A);
B=transpose(B);
xlswrite('contador.xlsx',A,'Hoja1','A2')
xlswrite('contador.xlsx',B,'Hoja2','A2')
cuenta=xlsread('contador.xlsx',3);

fprintf('\n\n\n')
fprintf('                                TABLA DE FRECUENCIAS  \n')
fprintf('          Posición      |  F.Observada   |   F.Esperada     |    Error  \n\n')
esp=(n-1)/in^2;
for v=1:in^2
error(v)=(in^2/(n-1))*(in*(cuenta(v)-esp)^2);
fprintf('    %10d          |  %6d        |    %6.5f       |    %6.5f  \n',F(v),cuenta(v),esp,error(v))
end
errortotal=sum(error);
tolerancia=chi2inv(1-alpha,(in^2)-1);
fprintf('           TOTAL        |  %7d             ERROR        |    %5.4f\n',n,errortotal)
fprintf('                                              TOLERANCIA    |    %5.4f\n',tolerancia)

h=(1-0)/in;
N(1)=0+h;
for j=2:in
N(j)=N(j-1)+h;
end

plot(x,y,'ob')
grid on
title('Prueba de Series')
xticks([0 N])
yticks([N])
xlabel('Eje X')
ylabel('Eje Y')