#Carregar dados

#### Grafico de barras/colunas ####
dados=read.csv('dados_plot.csv', sep=',', dec='.',header = T)
head(dados) #dados

#Mostrando os nomes das variaveis
names(dados)

#Mudando os nomes das variaveis
names(dados) = c('linha','empresa','rendimento','tamanho','vendas','palavra','fre_palavra')

#Construindo uma tabela para mostrar a quantidade de empresas dos tipos (a, b, c, d)
table(dados$empresa)

# Medidas por variavel tapply(valores, por, medida)
# Calculando a media dos redimentos de cada empresa (a, b, c, d)

tapply(dados$rendimento,dados$empresa, mean)

# biblioteca de graficos

install.packages('ggplot2')
library(ggplot2)
# comando base (basededados, x&y )
ggplot(dados)

#ggplot base
ggplot(dados,aes(x =empresa))

#adiciona colunas +geom_bar() ---> grafico de barras
ggplot(dados,aes(x =empresa))+ geom_bar()

#barra: +coord_flip() ---> grafico de colunas
ggplot(dados,aes(x =empresa)) + geom_bar()+ coord_flip()

#legenda e cor: fill =
ggplot(dados,aes(x =empresa,fill=empresa)) +geom_bar()

# nomes eixos e titulo
ggplot(dados,aes(x =empresa,fill=empresa)) +geom_bar() +
  labs(title = 'Grafico', x = 'Empresa' , y ='Total')

# mudar de cor: +scale_fill_brewer(palette = "Set3")
ggplot(dados,aes(x =empresa,fill=empresa)) +geom_bar() +
  scale_fill_brewer(palette = "Dark2") #PuOr,Greys, Paired, Set1, Set2, Set3, Dark2

# temas de fundo: +theme_dark()
ggplot(dados,aes(x =empresa,fill=empresa)) +geom_bar() +
  scale_fill_brewer(palette = "Set2") + theme_dark() #theme_bw(),theme_linedraw(),theme_light(),theme_dark(),theme_minimal()

# colunas agrupadas (add uma nova variavel em fill)
ggplot(dados,aes(x =empresa,fill=tamanho)) +geom_bar() +
  scale_fill_brewer(palette = "Set2") + theme_dark() 

# dividir por variavel: facet_wrap(~tamanho)
ggplot(dados,aes(x =empresa,fill=tamanho)) +geom_bar() +
  scale_fill_brewer(palette = "Paired") + theme_dark() + facet_wrap(~tamanho)


#### Grafico de dispersao ####
                  
                  #eixo-x   , eixo-y    
ggplot(dados, aes(rendimento, vendas))+ geom_point()

#tendencia(geom_smooth)
ggplot(dados, aes(rendimento, vendas))+ geom_point()+
  geom_smooth()

#cor(agora deve ser col=) remover smooth
ggplot(dados, aes(rendimento, vendas, col =empresa))+ geom_point()

# tendencia por empresa(col= empresa + smooth)
ggplot(dados, aes(rendimento, vendas, col =empresa))+ geom_point() +
  geom_smooth()

#remover desvio padrao(smooth(se = F))
ggplot(dados, aes(rendimento, vendas, col =empresa))+ geom_point() +
  geom_smooth(se=F)

#tendencia por empresa separados(faced_weap)
ggplot(dados,aes(x=rendimento,vendas,col=empresa))+geom_point()+
  geom_smooth(se=F)+ facet_wrap(~empresa)

#tendencia por empresa com tendencia e tema
ggplot(dados,aes(x=rendimento,vendas,col=empresa))+geom_point()+
  geom_smooth(se=F)+ facet_wrap(~empresa) +theme_minimal()




#### Grafico de pizza ####

#criar uma base de dados nova com uma tabela
table(dados$empresa)
dados1=as.data.frame(table(dados$empresa))

#mudar os nomes
names(dados1)[1]='empresa'
names(dados1)

#criar as % e % acumuladas
dados2=dados1
dados2$Freq=round(dados2$Freq/sum(dados2$Freq),3)
dados2$cum=cumsum(dados2$Freq)

ggplot(dados2, aes(x ="" , y = Freq,fill = empresa)) +
  geom_bar(width = 1, stat="identity") + coord_polar("y",start = 0) +
  scale_fill_brewer(palette="Set5")

#text: geom_text()
ggplot(dados2, aes(x ="", y = Freq,fill = empresa)) +
  geom_bar(width = 1, stat= "identity") + coord_polar("y",start = 0) +
  scale_fill_brewer(palette="Set3")+
  geom_text(aes(y = cum-0.2, label = Freq), color = "black")

#dunnet plot #x=2 e +xlim(0.5, 2.5)
ggplot(dados2, aes(x = 2, y = Freq,fill = empresa)) +
  geom_bar(width = 1, stat="identity") + coord_polar("y",start = 0) +
  scale_fill_brewer(palette="Set3")+
  geom_text(aes(y = cum-0.2, label = round(Freq,3)), color ="black")+
  theme_void()+xlim(0.5, 2.5)

###### Histograma ####

#parecido com grafico de barras, mas para variavel numerica continua
ggplot(dados, aes(rendimento))+ geom_histogram()
#numero de grupos: (bins)
ggplot(dados, aes(rendimento))+ geom_histogram(bins = 5)
#cor: (fill)
ggplot(dados, aes(rendimento))+ geom_histogram(bins = 5,fill='green')
#aes(fill=empresa)
ggplot(dados, aes(rendimento))+ geom_histogram(aes(fill=empresa),bins = 5)

##### Densidade ####
#eh um histograma, porem com linha e probabilidade
ggplot(dados, aes(rendimento))+ geom_density()
#por empresa aes(fill=factor(empresa))
ggplot(dados, aes(rendimento))+ geom_density(aes(fill=factor(empresa)))
#trasnparencia (alpha=)
ggplot(dados, aes(rendimento))+ geom_density(aes(fill=factor(empresa)), alpha=0.3)



##### Box plot #####
ggplot(dados,aes(y=rendimento))+ geom_boxplot()
#por empresa
ggplot(dados,aes(x=empresa, y=rendimento))+geom_boxplot()
#cor 
ggplot(dados,aes(x=empresa, y=rendimento, fill=empresa)) + geom_boxplot()
#comparar por tamanho
ggplot(dados,aes(x= empresa, y=rendimento, fill=empresa))+geom_boxplot() + facet_wrap(~tamanho)

##### Violino #####
ggplot(dados,aes(x= empresa, y=rendimento, fill= empresa))+ geom_violin()


##### tree map #####

# biblioteca de treemapify

library(treemapify) #####tree map####
ggplot(dados1,aes(area=Freq,fill=empresa))+geom_treemap()

#rendimento medio por tamanho x empresa (Ga,Gb... Pa, Pb)
dados$interacao=interaction(dados$tamanho,dados$empresa)
dados3=as.data.frame(tapply(dados$rendimento,dados$interacao, mean))
dados3
dados3$nomes=labels(dados3)[[1]]
names(dados3)[1]='total'
dados3
ggplot(dados3,aes(area=total,fill=nomes))+geom_treemap()

#### nuvem de letras ####

dados4=dados[,6:7]# dados com palavras
install.packages('wordcloud2')
library(wordcloud2)
wordcloud2(data=dados4, size=1.6)

  
##### pontos e linhas

install.packages('gganimate')
install.packages('gifski')
install.packages('png')
library(gganimate)
library(gifski)
library(png)

g=ggplot(dados,aes(x=rendimento,vendas,col=empresa))+geom_line()+geom_point()
g=g+transition_reveal(rendimento)
animate(g, rendere= gifski_renderer())

##### barra /coluna
ggplot(dados,aes(x=empresa,fill=empresa))+geom_bar()+theme_light()
g=ggplot(dados,aes(x=empresa,fill=empresa))+geom_bar()+theme_light()+
  transition_states(empresa)+shadow_mark()
animate(g, renderer = gifski_renderer())

g=ggplot(dados,aes(x=empresa,fill=empresa))+geom_bar()+theme_light()+
  transition_states(empresa)+shadow_mark()+enter_grow()+enter_fade()
animate(g, renderer = gifski_renderer())

##### Animado dispersão #####
install.packages('gapminder')
library(gapminder)
head(gapminder)

# relacao entre renda  x vida
ggplot(gapminder, aes(gdpPercap, lifeExp))+geom_point()+theme_bw()

# colorir por continente
ggplot(gapminder, aes(gdpPercap, lifeExp, col = continent)) +geom_point() +
  theme_bw()

#tamanho do ponto de acordo com a populacao
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
  geom_point() + theme_bw()

# arrumar nomes eixos
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
  geom_point() + theme_bw() +
  labs(title ='Ano: {frame_time}', x ='Renda per capita', y ='Expectativa de vida')

# animar 
grafico=ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
  geom_point() + theme_bw() +
  labs(title = 'Ano: {frame_time}', x = 'Renda per capita', y ='Expectativa de vida') +
    transition_time(year)

animate(grafico, renderer = gifski_renderer())
