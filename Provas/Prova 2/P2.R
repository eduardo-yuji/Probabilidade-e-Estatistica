#Exercício 1
install.packages('ggplot2')
library(ggplot2)
#a)
dados = read.csv('ex1.csv',sep = ',',dec = '.',header = T)
ggplot(dados,aes(tempo))+geom_histogram(bins=30)
media = mean(dados$tempo)
#b)
pexp(300, 1/media)

#c)
pexp(400, 1/media)-pexp(200, 1/media)

#d)
qexp(0.7, 1/media)

#e)
dados$ptempo=dexp(dados$tempo,1/media)
ggplot(dados,aes(tempo))+geom_histogram(aes(y=..density..),bins=40)+geom_line(aes(tempo,ptempo,col='red'))

#Exercício 2
#binomial
#a)
sum(dbinom(75:100,100,14/20))

#b)
dbinom(70,100,14/20)

#c)
pbinom(19,100,6/20)

#d)
4000*6/20

#e)
x=45:95
dx=dbinom(x,100,14/20)
dados1 = data.frame(x, dx)
ggplot(dados1, aes(x, dx))+geom_col()

#Exercício 3
#a)
dpois(15, 20)

#b)
sum(dpois(20:30,20))
ppois(30, 20)-ppois(20, 20)

#c)
1-ppois(449,20*24)

#d)
1-ppois(34,30)

#e)
x=0:45
dx=dpois(x,20)
dados2=data.frame(x,dx)
ggplot(dados2,aes(x,dx))+geom_col()+theme_minimal()

#Exercício 4
#a)
dados3 = read.csv('ex4.csv', dec = ".", header = T)
ggplot(dados3,aes(peso))+geom_histogram()

#b)
pnorm(45, mean(dados3$peso),sd(dados3$peso))+(1-pnorm(55, mean(dados3$peso),sd(dados3$peso)))

#c)
0

#d)
qnorm(0.3, mean(dados3$peso), sd(dados3$peso))
qnorm(0.7, mean(dados3$peso), sd(dados3$peso))

#e)
dados3$dx=dnorm(dados3$peso, mean(dados3$peso), sd(dados3$peso))
ggplot(dados3, aes(peso, dx))+geom_histogram(aes(y=..density..))+geom_line(col='red')
