clear all, clc
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
fprintf(' Serie - (valores entre 0 y 1) \n\n')

for z=1:n
    y(z)=x(z+1)/m;
    fprintf("            %5.5f\n",y(z));
end
fprintf('\n\n\n')
fprintf('        Corridas \n\n')
for z=1:n-1
if y(z+1)>y(z)
    t(z)=1;
    else
    t(z)=0;
end   
    fprintf("       %5d\n",t(z));
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
longitud=sort(unique(rachas));
ordenado=sort(rachas);
for d = 1 : length(ordenado)-1
    if ordenado(d+1)== ordenado(d)
    v(o) = v(o)+1;
    else
    o = o+1;
    v(o) = 1;
    end
end

fprintf('\n\n\n')
fprintf('                                TABLA DE FRECUENCIAS  \n')
fprintf('   Longitud de Corrida (i)      |  F.Observada   |   F.Esperada     |    Error  \n\n')
for m=1:length(longitud(1:3))
    f(m)=2*(abs((n*(longitud(m)^2+3*longitud(m)+1)-(longitud(m)^3+3*longitud(m)^2-longitud(m)-4))/factorial(longitud(m)+3)));
    error(m)=(f(m)-v(m))^2/f(m);
    fprintf('    %10d                  |  %6d        |    %6.5f      |    %6.5f  \n',longitud(m),v(m),f(m),error(m))
 
end

if length(longitud)>3
for m=4:length(longitud)
    f(m)=2*(abs((n*(longitud(m)^2+3*longitud(m)+1)-(longitud(m)^3+3*longitud(m)^2-longitud(m)-4))/factorial(longitud(m)+3)));
end
V=sum(v(4:length(longitud)));
F=sum(f(4:length(longitud)));
error(4)=(f(4)-v(4))^2/f(4);
fprintf('    %10d    a más         |  %6d        |    %6.5f      |    %6.5f  \n',length(longitud(1:3))+1,V,F,error(4))
errortotal=sum(error(1:length(longitud(1:3))+1));
tolerancia=chi2inv(1-alpha,length(longitud(1:3))+1-1);
else
errortotal=sum(error(1:length(longitud(1:3))));
tolerancia=chi2inv(1-alpha,length(longitud(1:3))-1);  
end

fprintf('\n')
fprintf('                          ERROR        |    %6.5f\n',errortotal)
fprintf('                          TOLERANCIA   |    %6.5f\n',tolerancia)