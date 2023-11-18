source('https://t.ly/6R0IK') # carregar prova
avaliacao3(2320606) # troque ra pelo número do seu RA,

#Para cada exercicio, uma base de dados foi criada, com os nomes ex1,ex2,..., como pode ser observado na aba Environment.
#Apos resolver todos os exercicios, elabore um relatório e insira no google academico.

#ex1) Construa um IC para media considerando um nivel de confianca de de 95% (1.0)
ex1
t.test(ex1,conf.level = 0.95)
# Averdadeira média está entre 20.27168  e 22.63952 com 95% de confiança



#ex2) Construa um IC para proporcao de sucessos (p=1 sucesso) considerando um nivel de confianca de de 94% (1.0)
ex2
table(ex2)
prop.test(12, 40, conf.level = 0.94)
#a verdadeira proporção de sucessos está entre 0.1746059  e 0.4607305 com 94% de confiança.



#ex3) Teste se a media eh igual ou diferente de 21.5 considerando um nivel de confianca de 94.5%  (2.0)
ex3
H0=21.5
H1=!21.5
t.test(ex3,alternative ='two.side',mu=H0,conf.level=0.945)
# Com 94.5% de confiança, não se rejeita a hipótese nula (H0)
# Como o  p-value = 0.9386 (p-value > 5.5%), portanto não se pode afirmar que a média é diferente de 21.5



#ex4) Teste se a proporcao de sucessos (p=1 sucesso) eh igual ou diferente de 42.5% 
#considerando um nivel de confianca de de 95.5%(2.0)
table(ex4)
H0 = 0.425
H1 =! 0.425
prop.test(21,49,alternative ='two.side',p=H0,conf.level =0.955)
#com 95.5% de confiança não rejeita-se a hipotese 0
#Como o p-value = 1 (p-value > 4.5%), portanto não se pode afirmar que a verdadeira proporção é diferente de 42.5%



#ex5) Teste se a media da populacao X eh igual ou diferente da de Y considerando um nivel de confianca de de 93.5%.
#Suponha duas amostras independentes (2.0)
ex5x
ex5y
#H0: x-y = 0
#H1: x-y =! 0
t.test(ex5x,ex5y,alternative ='two.side', conf.level =0.935)
#com 93.5% de confiança rejeita-se a hipotese 0
#Como o p-value = 0.0009756 (p-value < 6.5%), portanto pode se afirmar que a média da população x é diferente da média da populaçao y



#ex6) Teste se a media de antes eh igual ou diferente da de depois, considerando um nivel de confianca de de 93%. 
#Suponha duas amostras dependentes. (2.0)
ex6antes
ex6depois
#H0= ex6antes - ex6depoiss = 0
#H1= ex6antes - ex6depois != 0
mean(ex6antes)
t.test(ex6antes,ex6depois,alternative="two.side",conf.level=0.93,paired=T)
#com 93% de confiança não rejeita-se a hipotese 0
#Como o p-value = 0.1647 (p-value > 7%), portanto não se pode afirmar que a média do da amostra ex6antes é diferente de ex6depois
#como a diferença da média é positiva, a média da amostra ex6antes é maior do que a ex6depois
