### $ CONTROL ENTER PRA RODAR A LINHA $ ###

#BASICO
1+1
1-5
5/5
5*8

# FUNÇÕES TRIGONOMETRICAS
sin (pi/2)
cos(pi)
tan(pi/4)

# VETOR
x = c(1,2,3,4)
x+1 
y=c(2:5) #() mostrar 
x+y

# MATRIZ
# nrow numero de linhas
# byrow organiza por coluna ou por linha (T ou F)

z = matrix (x, nrow = 2, byrow = F)
z
z= matrix (x, nrow = 2,byrow = T)
z
solve(z)                        #inversa
t(z)                            #transposta
determinant(z) 

# Derivada
D (expression (x^2), 'x')
D (expression(tan(x)*sin(x)^2), 'x')

#install.packages('mosaicCalc')

# Integral indefinida
library(mosaicCalc)
antiD(a*x^2 ~x)

# Funções 
funcao = function(x){
  2*x-1
}
funcao(1)

# Curva de -10 a 10
curve(funcao, -10,10)

#linha h = horizontal / v = vertical
#cor col = 'cor' ou 'numero'
abline(h=6, col= 'green')
abline( v=8 , col='red')
abline( v=0 , col='blue')

# Raiz
uniroot(funcao, lower = 0, upper = 4)

install.packages('rootSolve')
# Mais de uma raiz
library(rootSolve)

funcao2=function(x){
  2*x^2-3*x-4
}
curve(funcao2, -2,3)
abline(h=0)

multiroot(funcao2, start = c(-1,2))
abline(v=c(-0,850,2.350), col=2)

#Integral definida
integrate(funcao,0,2)

teste=function(x){
  x^2-5*x+6
}
curve(teste, 1.5, 3.5)
abline(h=0)

multiroot(teste, start = c (2,3))
abline(v=c(2,3), col=2)

