####27/09####
#n = 10
#p = 0.1

prob = function(x, n, p){
  choose(n,x) * p^(x) * ((1-p)^(n-x))
}

#a
prob(0, 10, 0.1)

prob(2, 10, 0.1) #Dois queimarem? 0.04
#c
sum(prob(1:10, 10, 0.1))
#d
sum(prob(1:9, 10, 0.1))
1-prob(10, 10, 0.1)
#e
0.1*10
#f
sqrt(0.1*(0.9))

prob(8,10,0.9)
sum(prob(3:10, 10, 0.9))

#Três em cada quatro alunos de uma universidade fizeram cursinho antes de prestar vestibular. 
#Se 16 alunos são selecionados ao acaso, qual é a probabilidade de que:

sum(prob(12:16, 16, 3/4)) #Pelo menos 12 tenham feito cursinho?

sum(prob(0:13, 16, 3/4)) #No máximo 13 tenham feito cursinho?

prob(12, 16, 3/4) #Exatamente 12 tenham feito cursinho?
#Em um grupo de 80 alunosselecionados ao acaso, qual é o número esperado de alunos que fizeram cursinho? 
#E a variância?
3*80/4
(3/4)*(1-3/4)

####10/10####

#Poisson
  prob = function(y,x){
    (exp(-y)*(y^x))/(factorial(x))
  }
#y = média (lambda)
#x = quantidade de sucesso
#Um departamento que funciona 24h por dia,recebe em média 5 ligações por hora. Determine as probabilidades

prob(5,2) #Receber 2 ligações em uma hora? 0.08

prob(5,0)+prob(5,1)+prob(5,2) #Receber menos de 3 ligações em uma hora? 0.124

1-sum(prob(5,0:5)) #Receber mais de 5 ligações em uma hora? 0.384

dpois(260,240) #Receber 260 ligações em 2 dias? Lambda=240. 0.01

#Suponha o lançamento de um dado 5 vezes. Sucesso será os valroes menos que 3. Determine:

dbinom(2,5,1/3) #A probabilidade de 2 sucessos
dbinom(0:5,5,1/3) #Todas as probabilidades

pbinom(2,5,1/3) #A probabilidade de 2 ou menos sucessos

qbinom(0.7901,5,1/3) #O valor de A, tal que P(x<=A)= 0.7901

rbinom(10,5,1/3) #Uma amostra aleatória de tamanho 10

barplot(table(rbinom(10,5,1/3))) #plot sem ggplot

install.packages('ggplot2')
install.packages('labeling')
library(ggplot2)
library(labeling)
x=0:5
px=dbinom(x,5,1/3)
dados = data.frame(x,px)
ggplot(dados,aes(x,px))+geom_col()

####11/10####

#media = 40 itens por segundo

dpois(35,40) #Probabilidade de processar 35 itens

dpois(0:475,40) #Todas as probabilidades?

ppois(45,40) #A probabilidade de 40 o menos sucessos

qpois(0.8096,40) #O valor de A, tal que P(X<=A)=0.8096

rpois(10,40) #Uma amostra aleatória de tamanho 10

#Apresente graficamente todas as probabilidade de sucesso
x=0:475
px=dpois(x,40)
dados = data.frame(x,px)
ggplot(dados,aes(x,px))+geom_col()


#### Modelo Exponencial ####
#modelo Exponencial -> começa do 0 -> coisas positivas
#modelo normal -> -inf até +inf
#taxa = 1/media
taxa = 1/7
#Suponha que o tempo de validade de determinado produto possua uma média de 7 anos. Determine:
dexp(6,taxa) #A probabilidade vencer em exatamente 6 anos -> 0, pois a probabilidade de um ponto é 0

pexp(5,taxa) #A probabilidade de vencer em 5 anos ou menos

qexp(0.5,taxa) #Determine o valor mediano

rexp(10,taxa) #Amostra aleatória de tamanho 10

x=rexp(500,taxa)
dx=dexp(x,taxa)
dados = data.frame(x,dx)
ggplot(dados,aes(x))+geom_histogram(aes(y=..density..))+geom_line(aes(x,dx,col='red'))


