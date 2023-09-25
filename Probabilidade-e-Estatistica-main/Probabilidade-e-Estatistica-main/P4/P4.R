#ex2
install.packages('ggplot2')
library(ggplot2)

install.packages('easyanova')
library(easyanova)

dados1=read.csv('dados1.csv', sep = ',',dec='.',header = T)
ggplot(dados1,aes(x =peso, y=maquina, fill = maquina))+ geom_boxplot() 


modelo=ea1(dados1, design = 1)
modelo$`Analysis of variance`


#teste de hipotese

#H0: Não existe efeito de tratamento
#H1: Ao menos um tramento tem efeito

#p-valor = menor que 0,001 (abaixo de 5%) -> logo rejeita a hipotese  e portanto ao menos 1 tem efeito(H1)
# comparação 2 a 2 para descobrir o melhor tramento(teste de tukey)

modelo$Means

# logo podemos concluir que o bico d ou a apresentam o menor desperdicio, visto que são iguais 



#ex3

dados2=read.csv('dados2.csv', sep = ',',dec='.',header = T)

ggplot(dados2,aes(x = resistencia, y= estrutura, fill = estrutura))+ geom_boxplot()

modelo=ea1(dados2, design = 2)
modelo$`Analysis of variance`

#teste de hipotese

#H0: Não existe efeito de tratamento
#H1: Ao menos um tramento tem efeito

#p-valor = menor que 0,001 (abaixo de 5%) -> logo rejeita a hipotese  e portanto ao menos 1 tem efeito(H1)
# comparação 2 a 2 para descobrir o melhor tramento(teste de tukey)

modelo$'Adjusted means'

# logo podemos concluir que o bico d ou a apresentam o menor desperdicio, visto que são iguais 

dados2=read.csv('dados2.csv', sep = ',',dec='.',header = T)
ggplot(dados2,aes(x = resistencia, y= estrutura, fill = estrutura))+ geom_boxplot()
modelo=ea1(dados2, design = 2)
modelo$`Analysis of variance`
modelo$'Adjusted means'
