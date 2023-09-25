##### Analise de variancia (30/05) #####


install.packages('agricolae')
library(agricolae)
# gerando aleatoriamente como serão divididas as rações para as vacas (casualidade)
tratamentos = c('d1', 'd2', 'd3')
rep=5
croqui=design.crd(tratamentos, rep)


# fazendo analise de variancia via grafico(ggplot)
install.packages('easyanova')
library(easyanova)

data(data1)
data1

install.packages('ggplot2')
library(ggplot2)

ggplot(data1,aes(x = Diet, y= Gain, fill = Diet))+ geom_boxplot()


#ANOVA
modelo=ea1(data1, design = 1)
modelo$`Analysis of variance`

#teste de hipotese

#H0: Não existe efeito de tratamento
#H1: Ao menos um tramento tem efeito

#p-valor = 0,0146 (abaixo de 5%) -> logo rejeita a hipotese  e portanto ao menos 1 tem efeito(H1)

# comparação 2 a 2 para descobrir o melhor tramento(teste de tukey)

modelo$Means

# Delineamento em bloco casualizado(DBC)
# peso = ração + raça + erro
# y = tratemento + bloco + erro

# gerando aleatoriamente como serão divididas as rações para os determinados blocos  (casualidade dentro de cada bloco)
tratamentos = c('d1', 'd2', 'd3')
bloco=4
croqui=design.rcbd(tratamentos, bloco)

data(data2)
#-> sempre nessa ordem
# tratamento | bloco | Gain
dados2 = data.frame(data1$Diet, data1$Gain)

ggplot(data2,aes(x = Treatments, y= Gain, fill = Treatments))+ geom_boxplot()

#ANOVA
modelo=ea1(data2, design = 2)
modelo$`Analysis of variance`
#teste de hipotese

#H0: Não existe efeito de tratamento
#H1: Ao menos um tramento tem efeito

#p-valor = 0,0465 (abaixo de 5%) -> logo rejeita a hipotese  e portanto ao menos 1 tem efeito(H1)

modelo$`Adjusted means`

# Como t2 e t1 sao iguais escolha o que é mais viavel



