#función para obtener los pesos de Newton-Cotes para fórmulas abiertas y cerradas
    #ARCHIVO FUNCIÓN

function [nodos pesos]= integralNC(a,b,n,izda,dcha)
   #n=numeor de nodos
   #izda y dcha son binarias 0-abiertas, 1-cerradas
   #el operador ! convierte 0 en 1 y cualquier valor no nulo en 0
   nn=n+!izda+!dcha; #se cuentan extremos faltantes
   nodos=linspace(a,b,nn); #distribución provisional
   #ahora se retiran los nodos sobrantes
   if !izda nodos(1)=[]; endif #abierta por la izquierda
   if !dcha nodos(end)=[]; endif #abierta por la derecha
   #preparación de la matriz de Vandermonde
   M=flip(vander(nodos)');
   #términos independientes
   i=[1:n]'; #lista auxiliar de índices en columnas
   c=(b.^i-a.^i)./i;

   #ALTERNATIVA
   %{
   M=ones(n); %ya va la primera fila de 1
   M(2,:)=nodos; %para evitar 0^0
   for i=2:n-1 %restante matriz de Vandermonde
     M(i+1,:)=nodos.^i;
   endfor
   c=zeros(n,1);
   for i=1:n
     c(i,1)=(b^i-a^i)/i;
   endfor
   %}

   pesos= (M\c)'; #en forma de fila

endfunction

