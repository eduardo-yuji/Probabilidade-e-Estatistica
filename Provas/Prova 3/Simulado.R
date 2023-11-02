#Considerando os dados do ex1.csv, construa um intervalo de confiança para a ariável altura, considerando 7% de 
#significância. Apresente um histograma da variável juntamente com a média e os limites

install.packages("ggplot2")
library(ggplot2)

dados1=read.csv("ex1.csv")
t.test(dados1$altura,conf.level = 0.93)
#A verdadeira média está entre 18.64731 e 20.19142 com 93% de confiança
x1 = 18.64731
x2 = 20.19142
media = mean(dados1$altura)
#ggplot(dados1,aes(altura,media))+geom_histogram(aes(y=..density..))+geom_vline(xintercept = x1:x2,col='blue')
ggplot(dados1,aes(altura))+geom_histogram(bins=6)+geom_vline(xintercept=media,col='red')+geom_vline(xintercept = c(x1,x2),col='blue')


#De 200 equipamenos recolhidos pela universidade, foi determinado quais estavam funcionand ou não. Determine
#a estimativa de equipamentos quebrados, bem como uma estimativa confiável para a verdadeira proporção
#de equipamentos quebrados da Universidade, considerando um nível de significância de 3%. Interprete os resutlados.

dados2=read.csv("ex2.csv")
table(dados2)

prop.test(107, 200, conf.level = 0.97)
#a verdadeira proporção de equipamentos quebrados na universidade está entre 0.4560724 e 0.6122653 com 97% de confiança.

#Considerando os dados do de altura do ex1.csv, verifique-se podemos afirmar se a verdadeira média é menor que 21, considerando 
#um nível de signifiância de 5%. Interprete os resutlados. Apresente o histograma com o intervalo de confiança (apenas limite 
#superior) obtido
H0 = 21
H1 < 21

t.test(dados1$altura,alternative ='less', mu=H0,conf.level=0.95) #menor que H0
# Com 95% de confiança, rejeita-se a hipótese 0
# Como o  p-value = 0.000185 (p-value < 5%), portanto a verdadeira média é menor de 21

ggplot(dados1,aes(altura))+geom_histogram(bins=6)+geom_vline(xintercept=media,col='red')+geom_vline(xintercept = 20.11,col='blue')


#Considerando os dados do ex2, verifique se podemos afirmar que a verdadeira proporção
p0 = 0.6
p0 != 0.6
prop.test(107,200,alternative ='two.side',p=p0,conf.level =0.98)
#com 98% de confiança não rejeita-se a hipotese 0
#Como o p-value = 0.0712 (p-value > 2%), portanto não pode se afirmar que a verdadeira proporção é diferente de 60%
#os limites de rejeição são de 0.4506527(45%) e 0.6174476(61%)



#Duas marcas
dados3=read.csv("ex5.csv")
table(dados3)
#H0=dados3$temperaturaA - dados3$temperaturaB = 0
#H1=dados3$temperaturaA - dados3$temperaturaB =! 0
head(dados3)
t.test(dados3$temperaturaA,dados3$temperaturaB,alternative ='two.side', conf.level =0.94)
#com 94% de confiança rejeita-se a hipotese 0
#Como o p-value = 0.005302 (p-value < 6%), portanto pode se afirmar que a média das resistências de a é diferente de b

var=c(rep("a",60),rep("b",60))
d1=data.frame(var=var,res=c(dados3$temperaturaA,dados3$temperaturaB))
ggplot(d1,aes(x=var,y=res,fill=var))+geom_boxplot()



