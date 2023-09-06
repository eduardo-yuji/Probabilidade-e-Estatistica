install.packages('ggplot2')
install.packages("treemapify")
install.packages("wordcloud2")
install.packages("gganimate")
install.packages("gifski")
install.packages("png")
install.packages("gapminder")


library(ggplot2)

dados1 = read.csv('dados_plot.csv',sep = ',',dec = '.',header = T)
head(dados1)
names(dados1)=c('linha','empresa','rendimento','tamanho','vendas','palavras','palavra_livre')
dados1
tapply(dados1$rendimento, dados1$empresa, mean)

ggplot(dados1, aes(empresa,fill=empresa))+geom_bar()+scale_fill_brewer(palette='Set3')+theme_dark()+facet_wrap(~tamanho)

#tendencia
ggplot(dados1, aes(rendimento, vendas))+geom_point()+geom_smooth()
#cor

ggplot(dados1, aes(rendimento, vendas, col=empresa))+geom_point()
#tendencia por empresa
ggplot(dados1, aes(rendimento, vendas, col=empresa))+geom_point()+geom_smooth()
#revomer desvio padrao (standard false)
ggplot(dados1, aes(rendimento, vendas, col=empresa))+geom_point()+geom_smooth(se=F)
#tendencia por empresa separados
ggplot(dados1, aes(rendimento, vendas, col=empresa))+geom_point()+geom_smooth(se=F)+facet_wrap(~empresa)



####histograma####
#para variavel numerica continua

ggplot(dados1,aes(rendimento))+geom_histogram()

#numero de grupos
ggplot(dados1,aes(rendimento))+geom_histogram(bins=5)

#cor
ggplot(dados1,aes(rendimento))+geom_histogram(bins=5,fill='orange')

#aes
ggplot(dados1,aes(rendimento))+geom_histogram(aes(fill=empresa),bins=5)
#ggplot(dados1,aes(rendimento))+geom_histogram(aes(fill=palavras),bins=5)

#linha e probabilidade
ggplot(dados1,aes(rendimento))+geom_density()

#por empresa
ggplot(dados1,aes(rendimento))+geom_density(aes(fill=factor(empresa)))

#cor transparente
ggplot(dados1,aes(rendimento))+geom_density(aes(fill=factor(empresa)),alpha=0.6)
#ggplot(dados1,aes(rendimento))+geom_density(aes(fill=factor(palavra_livre)),alpha=0.5)



####boxplot####
ggplot(dados1,aes(y=rendimento))+geom_boxplot()

#por empresa
ggplot(dados1,aes(x=empresa,y=rendimento))+geom_boxplot()

#cor
ggplot(dados1,aes(x=empresa,y=rendimento,fill=empresa))+geom_boxplot()

tapply(dados1$rendimento,dados1$empresa,sd)

#comparar por tamanho
ggplot(dados1,aes(x=empresa,y=rendimento,fill=empresa))+geom_boxplot()+facet_wrap(~tamanho)
#ggplot(dados1,aes(x=empresa,y=rendimento,fill=empresa))+geom_boxplot()+facet_wrap(~empresa)

ggplot(dados1,aes(x=empresa,y=rendimento,fill=empresa))+geom_violin()


####treemapfiy####
library(treemapify)

dados2=as.data.frame(table(dados1$empresa))
names(dados2)=c('empresa','Freq')
dados2
ggplot(dados2,aes(area=Freq,fill=empresa))+geom_treemap()

#rendimento pmedio por tamanho x empresa
dados1$interacao=interaction(dados1$tamanho,dados1$empresa)
dados3=as.data.frame(tapply(dados1$rendimento,dados1$interacao,mean))
dados3
dados3$nomes=labels(dados3)[[1]]
names(dados3)[1]='total'
dados3
ggplot(dados3,aes(area=total,fill=nomes))+geom_treemap()


####nuvem de letras####
#dados com palavras
library(wordcloud2)
dados4=dados1[,6:7]
dados4
wordcloud2(data=dados4,size=1.6)


####graficos animados - pontos e linhas####
library(gganimate)
library(gifski)
library(png)

g=ggplot(dados1,aes(x=rendimento,vendas,col=empresa))+geom_line()+geom_point()
g=g+transition_reveal(rendimento)

animate(g,render=gifski_renderer())

####animado dispersao####
library(gapminder)
head(gapminder)



