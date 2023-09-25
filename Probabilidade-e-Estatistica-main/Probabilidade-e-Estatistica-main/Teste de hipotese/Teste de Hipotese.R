##### Teste de Hipotese #####

# leitura dos dados 
dados=read.csv('ex1.csv', sep = ',',dec='.',header = T)

# Siginificancia = erro -> 6%  
# confianca = acerto    -> 94%

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


# leitura dos dados 

dados2=read.csv('ex3.csv', sep = ',',dec='.',header = T)

# Teste de teor alcolico considerando um nivel de siginifcancia 5% se o teor alcoolico 
#alterou apos a aplicação do metodo 
t.test(dados2$antes, dados2$apos, alternative = 'two.side', conf.level= 0.95, paired = T)




