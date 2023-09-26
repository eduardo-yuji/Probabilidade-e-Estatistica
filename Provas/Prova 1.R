install.packages('ggplot2')
library(ggplot2)

dados=read.csv('dados1.csv', sep = ',',dec='.',header = T)
head(dados)

#1
ggplot(dados,aes(x=fabricante, fill=tamanho))+geom_bar()+labs(title='Quantidade de Fabricantes pesquisados', x='Fabricante', y='Quantidade')

#2
ggplot(dados,aes(x=resistencia, y=fabricante, fill=tamanho))+geom_boxplot()+coord_flip()+labs(title = 'Resistencia dos produtos por tipo de fabricante e tamanho', x='Resistencia',y='Fabricante')

#3
interacao=interaction(dados$fabricante,dados$tamanho)
dados1=as.data.frame(tapply(dados$resistencia, interacao, mean))
d1$fabricante_tamanho=labels(d1)[[1]]
names(dados1)='media'
head(dados1)
ggplot(dados1,aes(x=media,y=))+geom_bar()
