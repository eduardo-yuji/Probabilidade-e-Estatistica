source('https://t.ly/6R0IK') 
avaliacao3(2367777) 

#Para cada exercicio, uma base de dados foi criada, com os nomes ex1,ex2,..., como pode ser observado na aba Environment.
#Apos resolver todos os exercicios, elabore um relatório e insira no google academico.

#ex1) Construa um IC para media considerando um nivel de confianca de de 93.5% (1.0)
t.test(ex1,conf.level =  0.935)
#[20.34703 , 22.56417]

#ex2) Construa um IC para proporcao de sucessos (p=1 sucesso) considerando um nivel de confianca de de 92% (1.0)
table(ex2)
28+12
prop.test(12,40,conf.level = 0.92)
#[0.1809382,0.4502161]

#ex3) Teste se a media eh igual ou diferente de 20.75 considerando um nivel de confianca de 92.75%  (2.0)
# HO: media = 20.75
# H1: media =! 20.75
t.test(ex3,alternative ='two.side',mu = 20.75,conf.level =0.9275)
1-0.9275
# 0.2289 > 0.0725
# Com 92,75% de confiança nao rejeita-se a hipotese nula, 
# logo a nao pode-se afirmar que a verdadeira media é diferente de 20.75


#ex4) Teste se a proporcao de sucessos (p=1 sucesso) eh igual ou
# diferente de 31.25% considerando um nivel de confianca de de 94.25%(2.0)
# HO: media = 31.25%
# H1: media =! 31.25%
table(ex4)
prop.test(21,49,alternative ='two.side',p = 0.3125,conf.level = 0.9425)
# 0.1099 > 0.0575
# COm 94,25% nao rejeita-se a hipotese nula, logo a nao pode-se afirmar que a verdadeira proporcao é diferente de 31,25% 

#ex5) Teste se a media da populacao X eh igual ou diferente da de Y considerando um nivel de confianca de de 91.25%. 
# Suponha duas amostras independentes (2.0)
#H0: mx = my
#H1: mx ≠ my
t.test(ex5x,ex5y, alternative ='two.side',conf.level = 0.9125 )
#  0.0003938 < 0.0875
# Rejeita-se a hipotese nula, logo pode-ser afirmar que a verdadeira media de x e y sao sao diferentes com 91,25% de confiança

#ex6) Teste se a media de antes eh igual ou diferente da de depois, considerando um nivel de confianca de de 90.5%. 
# Suponha duas amostras dependentes. (2.0)
#H0: mA = mD
#H1: mA ≠ mD
t.test(ex6antes,ex6depois, alternative ='two.side',conf.level = 0.905, pairde = T )
1 - 0.905 
# 0.2711 > 0.095
# Nao rejeita-se a hipotese nula, logo nao pode-se afirmar que a media de Antes é diferente da media depois,  com 90,5% de confiança