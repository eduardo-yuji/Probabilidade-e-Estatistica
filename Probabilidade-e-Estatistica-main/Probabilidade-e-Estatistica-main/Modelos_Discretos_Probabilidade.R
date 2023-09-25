##### Modelo Binomial #####

#A probabilidade de 2 sucessos
dbinom(2,5,2/6)

# vetor ordenado _> n:n
# Todas as probabilidades 
dbinom(0:5,5,2/6)

#A probabilidade de 2 ou menos sucessos
pbinom(2,5,2/6)

#O valor de A, Tal que P(x<=A) = 0.7901
qbinom(0.7901,5,2/6)

#Uma amostra aleatoria de tamanho 10
rbinom(10,5,2/6)


#base de dados
install.packages('ggplot2')
library(ggplot2)
x=0:5
px=dbinom(0:5,5,2/6)
dados = data.frame(x,px)
#plotando todas as probabilidades
ggplot(dados,aes(x,px))+ geom_col()+
  scale_fill_brewer(palette = "Set1") + theme_dark()


px=pbinom(0:5,5,2/6)
dados = data.frame(x, fill=x,px)
#plotando a função acumulada
ggplot(dados,aes(x,px))+ geom_col()+
  scale_fill_brewer(palette = "Set5") + theme_dark()

#A probabilidade de processar 35 itens 
dpois(35,40)

#Todas as probabilidades 
dpois(0:478,40)

#A probabilidade de 45 ou mais sucessos
ppois(45,40)

#O valor de A, tal que P(x<=A)= 0.8096
qpois(0.8096, 40)

#Uma amostra aleatoria de tamanho 10
rpois(10,40)

x=0:100
px= dpois(x,40)
dados= data.frame(x, px)
ggplot(dados,aes(x,px))+ geom_col()
