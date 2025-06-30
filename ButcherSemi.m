%Archivo función para evaluar un método RK dado su arreglo de Butcher,
%que puede ser implícito o explícito.

%Este archivo es la definción de quna función, por tanto la primera instrucción ejecutable debe ser function.

function [t1 x1]=ButcherSemi(a,b,c,t,x,h)
  m=length(c); #número de evaluaciones del método
  K(1)=f(t*c(1)*h,x); #K1 tiene que ir aparte
  if a(1,1)#si fuera semi implícito
    K(1)=fsolve(@(u)f(t+c(1)*h,x+h*a(1,1)*u)-u,K(1));
  endif
  for i=2:m
    K(i)=f(t+c(i)*h,x+h*a(i,1:i-1)*K(1:i-1)');
    if a(i,i) #si fuera semi implícito
      K(i)=fsolve(@(u)f(t+c(i)*h,x+h*a(i,1:i-1)*K(1:i-1)'+h*a(i,i)*u)-u,K(i));
    endif
  endfor
  t1=t+h;
  x1=x+h*b*K';
endfunction

