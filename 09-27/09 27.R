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


