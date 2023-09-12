install.packages("ggplot2")
library(ggplot2)

dados = read.csv('winequality-all2.csv',sep = ';',dec = '.',header = T)
head(dados)

#1
ggplot(dados, aes(x=quality))+geom_bar()+labs(title='Quantidade de Qualidades', x='Qualidade', y='Quantidade')+scale_fill_brewer(palette='Set3')+theme_light()

#2
ggplot(dados, aes(x=quality, fill=type))+geom_bar()+labs(title='Quantidade de Qualidades', x='Qualidade', y='Quantidade')+scale_fill_brewer(palette='Set3')+theme_light()

#3
ggplot(dados, aes(total.sulfur.dioxide, free.sulfur.dioxide, col=type))+geom_point()+geom_smooth()

#4
media= as.data.frame(tapply(dados$alcohol,dados$quality,mean))
names(media)='media'
media$labs=labels(media)[[1]]
ggplot(media,aes(labs,media,fill=media))+geom_col()

#5
ggplot(dados,aes(alcohol))+geom_histogram(bins=40)+labs(title='Teor de Álcool', x='Álcool',y='Quantidade')

#6
ggplot(dados,aes(y=pH,x=as.factor(quality),fill=type))+geom_boxplot()
