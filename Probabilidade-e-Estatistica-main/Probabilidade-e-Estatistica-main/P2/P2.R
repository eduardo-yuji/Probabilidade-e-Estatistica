##### Prova 2 #####

# exercicio 1

#a
dados=read.csv('ex1.csv')
ggplot(dados,aes(tempo))+geom_histogram()

#b
pexp(300,1/mean(dados$tempo))

#c
a = 1-pexp(200,1/mean(dados$tempo))
b = pexp(400,1/mean(dados$tempo))
c = -pexp(200,1/mean(dados$tempo))
sum(a,b,c)

#d
mean(dados$tempo)


#e

dados$px=dexp(dados$tempo,1/mean(dados$tempo))
ggplot(dados,aes(tempo,px))+geom_histogram(aes(y= ..density..))+geom_line(col='red')

# exercicio 2
#a

dbinom(70,100,30/100)

#b
dbinom(70,100,0.3)

#c
1-pbinom(19,100,30/100)

#d
4000*0.3

install.packages('ggplot2')
library(ggplot2)

x=0:100
px=1-dbinom(0:100,100,0.3)
dados = data.frame(x,px)
#plotando todas as probabilidades
ggplot(dados,aes(x,px))+ geom_col()+
  scale_fill_brewer(palette = "Set1") + theme_dark()

# Exercicio 3

x=0:10
px=dbinom(x,10,0.3)
dados1=data.frame(x,px)
library(ggplot2)
ggplot(dados1,aes(x,px))+geom_col()+theme_minimal()
#a
dpois(15, 20)

#b
x=20:30

a=dpois(30,20)
b=1-ppois(20,20)
sum(a,b)
#c
ppois(449, 20*24)

#d
1-ppois(34,30)


#e
x=0:40
px=dpois(x,20)
dados2=data.frame(x,px)
ggplot(dados2,aes(x,px))+geom_col()+theme_dark()





x=0:15
px=dpois(x,4)
dados = data.frame(x,px)
#plotando todas as probabilidades
ggplot(dados,aes(x,px))+ geom_col()+
  scale_fill_brewer(palette = "Set1") + theme_dark()


# Exercicio 4
#a
dados2=read.csv('ex4.csv')
ggplot(dados2,aes(peso))+geom_histogram()




#b
1-(pnorm(55,mean(dados2$peso),sd(dados2$peso))-pnorm(45,mean(dados2$peso),sd(dados2$peso)))

#c
#0

#d
dados2=read.csv('ex4.csv')
a = qnorm(0.3,mean(dados2$peso),sd(dados2$peso))

qnorm(0.3,mean(dados2$peso),sd(dados2$peso))
#e
dados2$px=dnorm(dados2$peso,mean(dados2$peso),sd(dados2$peso))
ggplot(dados2,aes(peso,px))+geom_histogram(aes(y= ..density..))+geom_line(col='red')




integrate(funcao,0,1)

k =1/0.2


#Exercicio 5

dados=read.csv('dadosex5.csv', sep = ',',dec='.',header = T)
dados$x

#a
#Exponecial
x=exp(dados$x,1/4.286455)
dx=dexp(x,1/4.286455)
dados=data.frame(x,dx)
ggplot(dados,aes(x))+geom_histogram(aes(y=..density..))+
  geom_line(aes(x,dx ,col='red'))

#b
mean(dados$x)


#c
1-pexp(2,(1/7.13))

#d
pexp(5,1/mean(dados$x))


#Exercicio 6
dados2=read.csv('dadosex6.csv', sep = ',',dec='.',header = T)
ggplot(dados2,aes(x))+ geom_histogram()

#a
#Modelo normal

#b
pnorm(25, mean(dados2$x), sd(dados2$x)) - pnorm(15, mean(dados2$x), sd(dados2$x))

#c
qnorm(0.2, mean(dados2$x), sd(dados2$x))

#d
