##### Exercicios Analise de variancia (01/06) #####

install.packages('agricolae')
library(agricolae)

install.packages('ggplot2')
library(ggplot2)

install.packages('easyanova')
library(easyanova)
# ex1
dados=read.csv('dados1ANOVA.csv', sep = ',',dec='.',header = T)
croqui=design.crd(dados$trat, 5)

data(data2)
data1

ggplot(dados,aes(x = trat, y= y, fill = trat))+ geom_boxplot()

modelo=ea1(dados, design = 1)
modelo$`Analysis of variance`

#teste de hipotese

#H0: N?o existe efeito de tratamento
#H1: Ao menos um tramento tem efeito

#p-valor = menor que 0,001 (abaixo de 5%) -> logo rejeita a hipotese  e portanto ao menos 1 tem efeito(H1)
# compara??o 2 a 2 para descobrir o melhor tramento(teste de tukey)

modelo$Means
# podemos concluir que a melhor ? a "e" ou a "b" pq s?o igual

#ex2
dados2=read.csv('dados2ANOVA.csv', sep = ',',dec='.',header = T)

ggplot(dados2,aes(x = bico, y= perda, fill = bico))+ geom_boxplot()


modelo=ea1(dados2, design = 2)
modelo$`Analysis of variance`


#teste de hipotese

#H0: N?o existe efeito de tratamento
#H1: Ao menos um tramento tem efeito

#p-valor = menor que 0,001 (abaixo de 5%) -> logo rejeita a hipotese  e portanto ao menos 1 tem efeito(H1)
# compara??o 2 a 2 para descobrir o melhor tramento(teste de tukey)

modelo$'Adjusted means'

# logo podemos concluir que o bico d ou a apresentam o menor desperdicio, visto que s?o iguais 


#ex3
dados3=read.csv('dados3ANOVA.csv', sep = ',',dec='.',header = T)
head=dados3
heado
ggplot(dados3,aes(x = reagente, y= tempo, fill = reagente))+ geom_boxplot()

modelo=ea1(dados3,design = 1)
modelo$`Analysis of variance`

#teste de hipotese

#H0: N?o existe efeito de tratamento
#H1: Ao menos um tramento tem efeito

# como o p-valor deu maior que 5% logo n?o podemos rejeitar a hipotese nula e 
# n?o podemos afirmar que as amostras s?o diferentes



