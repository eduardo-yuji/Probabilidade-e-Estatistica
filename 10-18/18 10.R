install.packages('ggplot2')
install.packages('labeling')
library(ggplot2)
library(labeling)
#3) A média de blocos defeituosos produzidos em um equipamento é de 4 por hora. Determine:
#a) A probabilidade de encontrar 4 blocos defeituosos em 1 hora?
dpois(4,4)

#b) A probabilidade de encontrar 6 ou mais blocos defeituosos em 1 hora?
1-ppois(5,4)

#c) A proprobabilidade de encontrar mais de 80 blocos defeituosos em 1 dia?
1-ppois(80,4*24)
#c) A proprobabilidade de encontrar menos de 85 blocos defeituosos em 1 dia?
ppois(84,4*24)
#d) Represente graficamente todas as probabilidades que blocos defeituosos em 1h.
dpois
x=0:15
px=dpois(x,4)
dados=data.frame(x,px)
ggplot(dados,aes(x,px))+geom_col()+theme_minimal()

#4) Determine o valor de K para que a função abaixo seja uma função densidade de probabilidade, sendo que 0<= x<= 1
#f(k)=kx^4
fx=function(x)x^4
k=1/integrate(fx,0,1)$value

#5) O tempo de vida x (horas) de determinado componente segue uma distribuição desconhecida. Uma amostra foi 
#retirada para o estudo
#a) Qual o modelo de probabilidade melhor se adequa aos dados?
dados=read.csv('dadosex5.csv',sep = ';',dec = '.',header = T)
ggplot(dados,aes(x))+geom_histogram(bins=30)
#O Modelo exponenical

#b) Qual a média do tempo de falha?
(media=mean(dados$x))

#c) Qual a probabilidade de falhar após 2 horas?
1-pexp(2,1/media)

#d) Qual a probabilidade de falhar antes de 5 horas?
pexp(5,1/media)

#e Apresente o modelo ajustado no histograma

dados$px=dexp(dados$x,1/media)
ggplot(dados,aes(x))+geom_histogram(aes(y=..density..),bins=40)+geom_line(aes(x,px,col='red'))


