####IC para Média####

#t.test(amostra,conf.level = nível)

#Suponha uma amostra de n=30 contendo os tamanhos dos pavers (ex1.csv):

#Determine um intervalo de confiança considerando um nível de 5% de significância,
#ou seja, 95% de confiança. Interprete
  dados = read.csv(file = "ex1.csv",dec = "." ,header = T)
  t.test(dados$tamanho,conf.level = 0.95)
  #A média está entre 16.94484 e 19.37310 cm 95% de confiança

#Determine um intervalo de confiança considerando um nível de 1% de significância,
#ou seja, 95% de confiança. Interprete
  t.test(dados$tamanho,conf.level = 0.99)
  #A média está entre 16.52267 e 19.79528 com 99% de confiança
  
#Determine um intervalo de confiança considerando um nível de 0% de significância,
#ou seja, 10% de confiança. Interprete
  t.test(dados$tamanho,conf.level = 1)
  #A média está entre -inf e inf com 100% de confiança


####IC para Proporção####

#prop.test(quantidade em estudo, tamanho da amostra, conf.level = nível)

#Suponha que em um teste de 20 produtos, 12 apresentaram defeitos. 
#Determine um IC com 95% de confiança para a proporção de produtos não defeituosos.  
  prop.test(8, 20, conf.level = 0.95)
  #a verdadeira proporção de produtos não defeituosos está entre 0.1997709 e 0.6358833 com 95% de confiança.

#Determine um IC com 95% de confiança para a proporção de produtos defeituosos.
  prop.test(12, 20, conf.level = 0.95)
  #a verdadeira proporção de produtos defeituosos está entre 0.3641167 e 0.8002291 com 95% de confiança.
  
  
  
  