install.packages("manipulate")
install.packages("ggplot2")
install.packages("labeling")
library(manipulate)
library(ggplot2)
library(labeling)

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

####Modelo de Regressão Linear Multipla####
install.packages("GGally")
library(GGally)

dados3=read.csv("dados3.csv")
head(dados3)
ggpairs(dados3)

modelo3=gamlss(tempo~km+temperatura+pb(chuva),data=dados3)
summary(modelo3)#não interpretar pb
#Interpretar as * no Mu Coefficients, temperatura não tem estrela, não influencia nos dados
#remover temperatura do do modelo
modelo3=gamlss(tempo~km+pb(chuva),data=dados3)
summary(modelo3)

modelo3$mu.fv
term.plot(modelo3)

plot(modelo3)#verificar se o modelo está bem ajustado
cbind(modelo3$mu.fv,dados3$tempo)
dados3$fv=modelo3$mu.fv
ggplot(dados3,aes(fv,tempo))+geom_point()+geom_smooth() #verificar se o modelo está bem ajustado

#tempo~ = -52.54177 + 2.98725Km -> a cada 1 km aumenta em 2.98725 o tempo
km = 35
chuva = 82
dados3novo=data.frame(km,chuva)
predict(modelo3,newdata=dados3novo)




dados4=read.csv("house_price.csv")
head(dados4)
names(dados4)

ggpairs(dados4)
modelo4=gamlss(Y.house.price.of.unit.area~pb(X2.house.age)+X3.distance.to.the.nearest.MRT.station+
                 X4.number.of.convenience.stores+pb(X5.latitude)+pb(X6.longitude),data=dados4)
term.plot(modelo4)
summary(modelo4)

plot(modelo4)



install.packages("leaflet")
install.packages("sp")
install.packages("sf")
library(leaflet)
library(sp)
library(sf)

lon = dados4$X6.longitude
lat = dados4$X5.latitude

leaflet() %>%
  addTiles() %>%
  addCircles(lng=lon[dados4$classe=='nova'], lat=lat[dados4$classe=='nova'],color = 'red')%>%
  addCircles(lng=lon[dados4$classe=='velha'], lat=lat[dados4$classe=='velha'],color = 'blue')

dados4$classe=ifelse(dados4$X2.house.age<=20,'nova','velha')
