##### Teste de Hipotese #####

# leitura dos dados 
dados=read.csv('ex1.csv', sep = ',',dec='.',header = T)

##Carregando biblioteca 
install.packages("ggplot2")
library("ggplot2")

# Exercicio 1
# Siginificancia = erro -> 7%  
# confianca = acerto    -> 93%

t.test(dados$altura,conf.level=0.93)
ggplot(dados,aes(altura))+geom_histogram()
# a verdadeira media esta de 17.04 ate 19,27 com 93% de confiança
ggplot(dados,aes(altura))+geom_histogram(bins = 6)+geom_vline(xintercept=19.41936  ,col= 'blue')+
  geom_vline(xintercept=c(18.64731,20.19142),col='red')

# Exercicio 2
# leitura dos dados
dados2= read.csv('ex2.csv', sep=',', dec='.', header=T)




# ----------------------------------------------------------------------------------------------------------
# Significancia = erro -> 3%
# Confianca =   acerto -> 97%

prop.test(107,200, conf.level=0.97)
# intervalo de confianca é de -> 0.4560724 0.6122653



# H0 => media  = 20
# H1 => media != 20
t.test(dados$tamanho, alternative="two.side" ,mu = 20,conf.level = 0.94)


# H0 => media = 18
# H1 => media < 18
t.test(dados$tamanho, alternative="less" ,mu = 18,conf.level = 0.96)

# H0 => media = 16
# H1 => media > 16

t.test(dados$tamanho, alternative = "greater", mu = 16, conf.level = 0.97)


##### Teste de proporcao #####

# H0 => proporcao  = 0.5
# H1 => proporcao != 0.5
prop.test(24,50,alternative = "two.side", p=0.5 ,conf.level = 0.98 )


# H0 => proporcao  = 0.65
# H1 => proporcao  < 0.65
prop.test(24,50,alternative = "less", p=0.65 ,conf.level = 0.94 )



##### Teste de hipotese para 2 amostras independentes ######
# leitura dos dados 
dados=read.csv('ex2.csv')

t.test(dados$a, dados$b, alternative ="two.side", conf.level = 0.95)

t.test(dados$a, dados$b, alternative= "less", conf.level = 0.95)

# H0 => m1-m2=0
# H1 => m1-m2>0
t.test(dados$a, dados$b, alternative= "greater", conf.level = 0.95)



prop.test(c(20,30),c(50,80),alternative ='two.side',conf.level = 0.95)
