install.packages("manipulate")
install.packages("ggplot2")
library(manipulate)
library(ggplot2)

x=runif(100,5,80)
y=10+6*x+rnorm(100,0,20)
dados=data.frame(x,y)


manipulate(plot(1:x), x = slider(5,10))
manipulate(
  ggplot(dados,aes(x,y))+geom_point()+geom_abline(slope=b,intercept=a,col='red')+
  annotate(geom='text',x=20,y=500,label='y=a+bx'),a=slider(0,50),b=slider(0,15)
)
dados1=read.csv("dados1.csv")

#manipulate(ggplot(dados1,aes(x=km,y=tempo))+geom_point()+geom_abline(slope=b,intercept=a,col='red')+annotate(geom='text',x=0,y=100,label='y=a+bx'),a=slider(0,50),b=slider(0,15))

ggplot(dados1,aes(x=km,y=tempo))+geom_point()+geom_smooth()

####Modelo de Regressão Linear Simples####

install.packages("gamlss")
library(gamlss)

modelo=gamlss(tempo~km,data=dados1) #modelo
summary(modelo) #resumo
#fazendo um teste de hipótese
#H0: B1 = 0
#H1: B1 =! 0
#p-value < 0.05 -> portanto o Km influencia no tempo
modelo$mu.fv #medidas ajustadas
hist(modelo$mu.fv-dados1$tempo) #normal com media de erro = 0
#modelo$mu - tempo = erro
term.plot(modelo) #efeitos
plot(modelo) #residuos

modelo=gamlss(tempo~km-1,data=dados1)#a = 0, B0 = 0, intercept = 0

####Modelo de Regressão Linear Simples Com Efeito não Linear####

dados2=read.csv("dados2.csv")
#errado -> ggplot(dados2,aes(km,tempo))+geom_point()+geom_smooth(method = 'lm')
ggplot(dados2,aes(km,tempo))+geom_point()+geom_smooth() #Não Linear

modelo2=gamlss(tempo~pb(km),data=dados2)
summary(modelo2)#não interpretar pb
modelo2$mu.fv
term.plot(modelo2)
plot(modelo2) 

km=c(1:10)
dadosnovo=data.frame(km)
predict(modelo2,newdata=dadosnovo) #previsão de tempo para k 1:10
