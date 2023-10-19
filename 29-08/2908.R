#Gráfico
install.packages('ggplot2')
library(ggplot2)

dados1 = read.csv('dados_plot.csv',sep = ',',dec = '.',header = T)
head(dados1)
names(dados1)=c('linha','empresa','rendimento','tamanho','vendas','palavras','palavra_livre')
dados1

#Tabela
table(dados1$empresa)

#Medidas por Variavel tapply(valores, filtro, funcao)
tapply(dados1$rendimento, dados1$empresa, mean)

#utilizando geom_col() é necessário informar o eixo x e y
#ggplot(dados1, aes(x=empresa))+geom_bar()
ggplot(dados1, aes(x=empresa))+geom_bar()+coord_flip()

#legenda e cor
ggplot(dados1, aes(empresa,fill=empresa))+geom_bar()

#nomes eixos e titulos
ggplot(dados1, aes(empresa,fill=empresa))+geom_bar()+labs(title='Titulo', x='Empresa', y='Total')

#mudar de cor
ggplot(dados1, aes(empresa,fill=empresa))+geom_bar()+scale_fill_brewer(palette='Set3')

#Tema de fundo
ggplot(dados1, aes(empresa,fill=empresa))+geom_bar()+scale_fill_brewer(palette='Set3')+theme_dark()

#Colunas agrupadas
ggplot(dados1, aes(empresa,fill=tamanho))+geom_bar()+scale_fill_brewer(palette='Set3')+theme_dark()

#Dividir por variável
ggplot(dados1, aes(empresa,fill=empresa))+geom_bar()+scale_fill_brewer(palette='Set3')+theme_dark()+facet_wrap(~tamanho)






