install.packages("mosaicCalc")
library(mosaicCalc)
install.packages("rootSolve")
library(rootSolve)

####funcoes trigonométricas:####
sin(pi/2)
cos(pi)
tan(pi/4)

####vetor####
x=c(1,2,3,4)
x+1
(y=c(2:5))
x+y

####Matriz####
z=matrix(x,nrow = 2,byrow = F)
z
z=matrix(x,nrow = 2,byrow = T)
z
solve(z) #inverse
t(z) # transposta
determinant(z)


####Derivada####
D(expression(x^2),'x')
D(expression(tan(x)*sin(x)^2),'x')

antiD(a*x^2~x)


####funcoes####
funcao=function(x){
  2*x-1
}
funcao(1)

#curva de -10 a 10
curve(funcao,-10,10,col='blue')
#linha h=horiz. v=vert.
abline(h=0,col='red')
#raiz
uniroot(funcao,lower=0,upper=4)


funcao2=function(x){
  2*x^2-3*x-4
}
curve(funcao2,-2,3)
abline(h=0)

multiroot(funcao2, start = c(-1,2))
abline(v=c(-0.850,2.350),col=2)

integrate(funcao,0,2)

ex1=function(x){x^2-5*x+6}
curve(ex1,1.5,3.5)
abline(h=0)
multiroot(ex1, start = c(2,3))
integrate(ex1,2,3)
