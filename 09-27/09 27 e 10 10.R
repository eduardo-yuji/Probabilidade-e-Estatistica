#n = 10
#p = 0.1

prob = function(x, n, p){
  choose(n,x) * p^(x) * ((1-p)^(n-x))
}

#a
prob(0, 10, 0.1)
#b
prob(2, 10, 0.1)
#c
sum(prob(1:10, 10, 0.1))
#d
sum(prob(1:9, 10, 0.1))
1-prob(10, 10, 0.1)
#e
0.1*10
#f
sqrt(0.1*(0.9))

prob(8,10,0.9)
sum(prob(3:10, 10, 0.9))


#a
sum(prob(12:16, 16, 3/4))
#b
sum(prob(0:13, 16, 3/4))
#c
prob(12, 16, 3/4)
#d
3*80/4
(3/4)*(1-3/4)



####Poisson####
  prob = function(y,x){
    (exp(-y)*(y^x))/(factorial(x))
  }
#y = média (lambda)
#x = quantidade de sucesso

#a
prob(5,2)

#b
prob(5,0)+prob(5,1)+prob(5,2)

#c
1-sum(prob(5,0:5))

#d
prob(240,260)
dpois(lambda=240,x=260)


dbinom(2,5,1/3)
dbinom(0:5,5,1/3)

pbinom(2,5,1/3)

qbinom(0.7901,5,1/3)

rbinom(10,5,1/3)

barplot(table(rbinom(10,5,1/3)))

install.packages('ggplot2')
library(ggplot2)
x=0:5
px=dbinom(x,5,1/3)
dados = data.frame(x,px)
ggplot(dados,aes(x,px))+geom_col()

