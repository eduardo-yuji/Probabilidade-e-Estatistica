#P3
#Deivid da silva galvao

#Questão 1
#lendo arquivo csv
# arq deve estar na mesma pasta
# abrir bloco de notas para verificar a sepercao dos dados
dados=read.csv('p3ex1.csv', sep = ',',dec='.',header = T)

install.packages("ggplot2")
# Carregando a biblioteca ggplot2
library(ggplot2)
# IC para media
mean(dados$peso)
t.test(dados$peso,conf.level = 0.96)
ggplot(dados,aes(peso))+geom_histogram()
ggplot(dados,aes(peso))+geom_histogram(bins = 8)+geom_vline(xintercept=49.07522  ,col= 'red')+
  geom_vline(xintercept=c(47.51532 ,50.63513),col='blue')

#Questão 2

dados2=read.csv('p3ex2.csv', sep = ',',dec='.',header = T)
contagem=table(dados2$tamanho)
incorretas=contagem["incorreto"]
prop.test(53, 100, conf.level = 0.96)


#Questão 3

dados3=read.csv('p3ex3.csv', sep = ',',dec='.',header = T)
t.test(dados3$tempo, mu = 50, alternative = "greater", conf.level = 0.95)



# Questao 4
dados4=read.csv('p3ex4.csv', sep = ',',dec='.',header = T)
t.test(dados4$antes, dados4$depois, alternative = "two.sided", conf.level = 0.94, paired = T)


# Questão 5
dados5=read.csv('p3ex5.csv', sep = ',',dec='.',header = T)
t.test(dados5$A, dados5$B, alternative = "two.sided", conf.level = 0.92)




