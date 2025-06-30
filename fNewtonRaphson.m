#Vamos a hacer un archivo función, esto es, un archivo que solo tienen una funcion. Por esto, no puede haber NADA antes de la función

function [x1, msg] = fNewtonRaphson(f,f1,x0,e)
  #Argumentos: funcion, derivada (f1), semilla (x0), error

  #resultados por defecto
  x1=0; msg='ERROR DESCONOCIDO';

  #Comprobación 1: la tolerancia es correcta (positiva)
  if e<=0
    msg='ERROR: La tolerancia no es positiva';
    return; #paro mi función
  endif

  #método de Newton Raphson
  n=0; #contador de iteraciones
  x1=x0;

  #este en la iteración que este, x0 es la aproximación antigua y x1 la nueva
  do
    n++;
    x0=x1;
    x1=x0-f(x0)/f1(x0);
  until abs(x1-x0)/abs(x1) <= e; #error relativo

  #salida con éxito
  msg=['En ' int2str(n) ' iteraciones']; #el mensaje es string y n es un entero, asi que uso int2str para transformarlo en string

endfunction

#para ejecutar esta función solo tengo que poner fNewtonRaphson y entre paréntesis los datos

