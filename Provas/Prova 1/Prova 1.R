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
names(dados1)='media'
dados1$tamanho=labels(dados1)[[1]]
head(dados1)
ggplot(dados1,aes(x=media,y=tamanho,fill=media))+geom_col()+coord_flip()

#4
ggplot(dados,aes(tempo,peso,color=tamanho))+geom_point()+geom_smooth(se=F)


#5
ggplot(dados,aes(x=fabricante,y=resistencia,fill=fabricante))+geom_violin()+labs(title='Resistencia por tipo de fabricante',x='Fabricante',y='Resistencia')
