install.packages('ggplot2')
library(ggplot2)

dados=read.csv('dados1.csv', sep = ',',dec='.',header = T)
head(dados)
#1
ggplot(dados,aes(x=fabricante, fill=tamanho))+geom_bar()+labs(title='Titulo', x='Fabricante', y='Quantidade')+scale_fill_brewer(palette = "Dark1")

#A saída foi um gráfico de barras agrupadas onde é mostrado a distribuição da quantidade de
#fabricantes pelo tamanho, para cada tipo de fabricante. As barras que representam os
#fabricantes são divididas em 3 partes representando os tamanhos de empresa(pequeno,
#médio, grande), e a altura representa a quantidade de fabricantes de um determinado tipo.

#2
ggplot(dados,aes(x=fabricante,y=resistencia,fill=tamanho))+geom_boxplot()

#A saída foi um gráfico em forma de diagrama de caixas onde é relacionado a resistência com
#o fabricante e seus tipos de tamanho, a linha que divide ao meio as “caixas” representa a
#mediana, é possível observar que os fabricantes B e D possuem mais outiliers (“pontos fora
#da curva”) que os fabricantes A e C, e além disso podemos observar que os fabricantes A e B
#possuem as maiores resistências de produtos.

#3
#dados$media = tapply(dados$resistencia,dados$fabricante,mean)
#dados$media1 = tapply(dados$resistencia,dados$tamanho,mean)
#ggplot(dados,aes(x=media,y=fabricante,fill=tamanho))+geom_col()+coord_flip()

medias <- aggregate(resistencia ~ fabricante + tamanho, data = dados, mean)
ggplot(medias,aes(x=fabricante, y=resistencia, fill=tamanho))+geom_col()+labs(x = "Fabricante", y = "Média de Resistência", fill = "Tamanho") +theme_get() + scale_fill_brewer(palette = "Paired")

#A saída foi um gráfico de barras agrupadas por fabricante conforme o tipo (grande, médio e
#pequeno) onde o eixo y representa a média das resistências, é possível notar que o
#fabricante A apresenta as maiores médias de resistência enquanto que o D apresenta as
#menores médias.


#4

ggplot(dados,aes(tempo,peso,color=tamanho))+geom_point()+facet_wrap(~tamanho)

#A saída é um gráfico de dispersão que mostra o peso por tempo de produção de acordo com
#o tipo de tamanho, fica perceptível que entre os valores 2 e 4 de tempo aproximadamente os
#3 tipos (grande, médio e pequeno) apresentam um pico de peso, logo entre esses valores de
#tempo seria um bom momento para a produção do produto.

#5

ggplot(dados,aes(resistencia,fabricante,fill=fabricante))+geom_violin()+coord_flip()
#A saída foi um gráfico de violino que relaciona as resistências (eixo y) com o fabricante (eixo
#x) onde são evidenciadas a distribuição dos dados, ou seja, onde estão concentrados a
#maioria dos valores, onde quanto maior a largura maior a densidade de valores na região.

