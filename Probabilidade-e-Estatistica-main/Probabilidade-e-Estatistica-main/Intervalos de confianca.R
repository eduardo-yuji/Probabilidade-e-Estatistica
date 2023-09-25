##### Intervalo de confianca #####
#base de dados
install.packages('ggplot2')
library(ggplot2)

# leitura dos dados 
dados=read.csv('ex1.csv', sep = ',',dec='.',header = T)

# IC para media
mean(dados$tamanho)
#considerando um nível de 5% de significância, ou seja, 95% de confiança.
t.test(dados$tamanho,conf.level = 0.95)
#considerando um nível de 1% de significância, ou seja, 99% de confiança.
t.test(dados$tamanho, conf.level = 0.99)
#considerando um nível de 0% de significância, ou seja, 100% de confiança.
t.test(dados$tamanho, conf.level = 1)

# IC para proporcao

#considerando um nível de 5% de significância, ou seja, 95% de confiança.(nao defeituosos)
prop.test(8,20, conf.level = 0.95)
#considerando um nível de 5% de significância, ou seja, 95% de confiança.(defeituosos)
prop.test(12,20, conf.level = 0.95)
