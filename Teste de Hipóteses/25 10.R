#Sempre mostrar as hipóteses
#primeira > afirmação do enunciado
#segunda > problema -> diferente, menor ou maior


#se o p-value < α, rejeita-se H0
#se o p-value > α, não rejeita-se H0


#### MÉDIA de uma AMOSTRA ####

#t.test(amostra,alternative ='two.side',mu=H0,conf.level =0.95) #diferente que H0
#t.test(amostra,alternative ='less', mu=H0,conf.level=0.95) #menor que H0
#t.test(amostra,alternative ='greater', mu=H0,conf.level =0.95) #maior que H0



#Uma amostra de 30 produtos foi obtida para que o tamanho médio desses sejam avaliados (ex1.csv)
dados=read.csv("ex1 (1).csv")
#Teste, considerando um nível de significância 6%, se a média do tamanho desses produtos é diferente de 20.
H0=20
H1=!20
t.test(dados$tamanho,alternative ='two.side',mu=H0,conf.level=0.94)
# Com 94% de confiança, rejeita-se a hipótese 0
# Como o  p-value = 0.004265 (p-value < 6%), portanto a media é diferente de 20

#Teste, considerando um nível de significância 4%, se a média do tamanho desses produtos é menor de 18.
H0 = 18
H1 < 18
t.test(dados$tamanho,alternative = 'less',mu = H0,conf.level = 0.96)
# Com 96% de confiança, não rejeita-se a hipótese 0
# Como o  p-value = 0.6046 (p-value > 4%), portanto não se pode afirmar que a média é menor que 18

#Teste, considerando um nível de significância 3%, se a média do tamanho desses produtos é maior de 16.
H0 = 16
H1 > 16
t.test(dados$tamanho,alternative = 'greater',mu = H0,conf.level = 0.97)
# Com 97% de confiança rejeita-se a hipótese 0
# Como o  p-value = 0.0005309 (p-value < 3%), portanto pode se afirmar que a média é maior que 16


#### PROPORÇÃO de uma AMOSTRA ####

#prop.test(amostra,n,alternative ='two.side',p=p0,conf.level =0.95) #diferente que p0
#prop.test(amostra,n,alternative ='less', p=p0,conf.level=0.95) #menor que p0
#prop.test(amostra,n,alternative ='greater', p=p0,conf.level =0.95) #maior que p0

#Uma amostra de 50 objetos foi obtida para avaliar as proporções de produtos que apresentaram falhas, 
#observando 24 defeitos

#Teste, considerando um nível de significância 2%, se a proporção de falhas é diferente de 50%.
H0 = 0.5
H1 =! 0.5
prop.test(24,50,alternative ='two.side',p=H0,conf.level =0.98)
#com 98% de confiança não rejeita-se a hipotese 0
#Como o p-value = 0.8875 (p-value > 2%), portanto pode não se afirmar que a verdadeira proporção é diferente de 50%

#Teste, considerando um nível de significância 6%, se a proporção de falhas é menor de 65%.
H0 = 0.65
H1 < 0.65
prop.test(24,50,alternative ='less',p=H0,conf.level =0.94)
#com 94% de confiança rejeita-se a hipotese 0
#Como o p-value = 0.008846 (p-value < 6%), portanto pode-se afirmar que a verdadeira proporção é menor que 65%














#### MÉDIA de duas amostras INDEPENTENTES ####

#t.test(amostra1,amostra2,alternative ='two.side', conf.level =0.95)
#t.test(amostra1,amostra2,alternative ='less', conf.level =0.95)
#t.test(amostra1,amostra2,alternative ='greater', conf.level =0.95)

#Suponha que duas amostras foram obtidas, uma para cada marca de fabricantes de tijolos (ex2.csv),
#para comparar as resistências desses
#Teste, considerando um nível de significância 5%, se as resistências médias são iguais ou diferentes

dados1=read.csv("ex2.csv")
#H0=dados1$a-dados1$b = 0
#H1=dados1$a-dados1$b =! 0

t.test(dados1$a,dados1$b,alternative ='two.side', conf.level =0.95)
#com 95% de confiança rejeita-se a hipotese 0
#Como o p-value = 0.008341 (p-value < 5%), portanto pode se afirmar que a média das resistências de a é diferente de b

#Teste, considerando um nível de significância 5%, se a resistência de A é MAIOR que a resistência de B

#H0=dados1$a-dados1$b = 0
#H1=dados1$a < dados1$b

t.test(dados1$a,dados1$b,alternative ='less', conf.level =0.95)
#com 95% de confiança não rejeita-se a hipotese 0
#Como o p-value = 0.9958 (p-value > 5%), portanto não se pode afirmar que a resistência de a é menor que a de b

#Teste, considerando um nível de significância 5%, se a resistência de A é MAIOR que a resistência de B

#H0=dados1$a-dados1$b = 0
#H1=dados1$a > dados1$b

t.test(dados1$a,dados1$b,alternative ='greater', conf.level =0.95)
#com 95% de confiança rejeita-se a hipotese 0
#Como o p-value = 0.004171 (p-value < 5%), portanto se pode afirmar que a resistência de a é maior que a de b









#### PROPORÇÃO de duas amostras INDEPENTENTES ####

#prop.test(c(casos1,casos2),c(n1,n2),alternative ='two.side', conf.level =0.95)
#prop.test(c(casos1,casos2),c(n1,n2),alternative ='less', conf.level=0.95)
#prop.test(c(casos1,casos2),c(n1,n2),alternative ='greater', conf.level =0.95)

#Duas amostras de duas marcas de equipamentos foram obtidas, com o
#objetivo de realizar comparações entre as mesmas. Os resultados foram:
  
#  A = 20 falhas entre 50 
#  B = 30 falhas entre 80

#Teste, considerando um nível de significância 5%, se a proporção de falhas de A é igual ou diferente da proporção de falhas de B

#H0= p1 - p2 = 0
#H1= p1 - p2 != 0

prop.test(c(20,30),c(50,80),alternative ='two.side', conf.level =0.95)
#com 95% de confiança não rejeita-se a hipotese 0
#Como o p-value = 0.9205 (p-value > 5%), portanto não pode se afirmar que a proporção de falhas de A é diferente de B



#### MÉDIA de duas amostras DEPENDENTES ####

#t.test(amostra1,amostra2,alternative="two.side",conf.level=0.95,paired=T)
#t.test(amostra1,amostra2,alternative="less",conf.level=0.95,paired=T)
#t.test(amostra1,amostra2,alternative="greater",conf.level=0.95,paired=T)


#O teor alcoólico (g/ml) de 50 cervejas foram avaliados antes e após a aplicação de um novo método de produção (ex3.csv)

#Teste, considerando um nível de significância 5%, se o teor alcoólico alterou após a aplicação do método

#H0= dados2$antes - dados2$apos = 0
#H1= dados2$antes - dados2$apos != 0

dados2=read.csv("ex3.csv")
t.test(dados2$antes,dados2$apos,alternative="two.side",conf.level=0.95,paired=T)
#com 95% de confiança  rejeita-se a hipotese 0
#Como o p-value = 2.2e-16 (p-value < 5%), portanto pode-se afirmar que a média do teor alcoólico de A é diferente de B
#como a diferença da média é negativa, o teor alccólico aumentou


