##### Intervalo de confianca #####
#base de dados
install.packages('ggplot2')
library(ggplot2)

# leitura dos dados 
dados=read.csv('ex1.csv', sep = ',',dec='.',header = T)

# IC para media
mean(dados$tamanho)
#considerando um n�vel de 5% de signific�ncia, ou seja, 95% de confian�a.
t.test(dados$tamanho,conf.level = 0.95)
#considerando um n�vel de 1% de signific�ncia, ou seja, 99% de confian�a.
t.test(dados$tamanho, conf.level = 0.99)
#considerando um n�vel de 0% de signific�ncia, ou seja, 100% de confian�a.
t.test(dados$tamanho, conf.level = 1)

# IC para proporcao

#considerando um n�vel de 5% de signific�ncia, ou seja, 95% de confian�a.(nao defeituosos)
prop.test(8,20, conf.level = 0.95)
#considerando um n�vel de 5% de signific�ncia, ou seja, 95% de confian�a.(defeituosos)
prop.test(12,20, conf.level = 0.95)
