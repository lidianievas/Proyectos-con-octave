function [x2, n, msg] = funSecante(f,x0,x1,tol,nmax)
  #Argumentos: funcion, semilla 1 (x0), semilla 2 (x1), tolerancia (tol) y el límite de iteraciones (nmax)

  #resultados por defecto
  x1=0; msg='ERROR DESCONOCIDO';

  #Comprobación 1: la tolerancia es correcta (positiva)
  if tol<=0
    msg='ERROR: La tolerancia no es positiva';
    return; #paro mi función
  endif



 n=0;

 do
   n++;
   x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
   x0=x1; x1=x2;
   if n>nmax
      msg='no converge';
      return; #paro mi función
   endif
 until (abs(x1-x0)/abs(x1))<tol;


  #salida con éxito
  msg=['converge']; #el mensaje es string

endfunction

