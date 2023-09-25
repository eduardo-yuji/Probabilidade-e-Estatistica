### $ Modelos de classificação $ ###

install.packages('ggplot2')
library(ggplot2)

install.packages('datasets')
library(datasets)
# base de dados da biblioteca datasets
data("iris")
head(iris)
table(iris$Species)

ggplot(iris,aes(Petal.Length,Petal.Width,col=Species))+geom_point()

install.packages("randomForest")
library(randomForest)


modelo=randomForest(Species~Petal.Length, data=iris)
predict(modelo)
table(iris$Species, predict(modelo))

#pega a diagonal da matriz ->(ACERTOS)
diag(table(iris$Species, predict(modelo)))

# taxa de acerto em % por classe
diag(table(iris$Species, predict(modelo)))/table(iris$Species)

#taxa de acerto em % do modelo
sum(diag(table(iris$Species, predict(modelo)))/table(iris$Species))/length(iris$Species)


cores=ifelse(iris$Species==predict(modelo), iris$Species, 'error')
iris$cores=cores
ggplot(iris,aes(Petal.Length, Petal.Width, col=cores))+geom_point()


#limpar a base de dados (rodar de novo a linha 8 a 11)
modelo=randomForest(Species~.,data=iris)
table(iris$Species, predict(modelo))
sum(diag(table(iris$Species, predict(modelo))))/length(iris$Species)

#fixar semente
set.seed(222)
split=sample(2,nrow(iris), replace= T, prob=c(0.7,0.3))
split
train = iris[split==1,]
test = iris[split==2,]


modelo=randomForest(Species~Petal.Length, data=train)
p=predict(modelo, newdata=test)
table(test$Species, p)
sum(diag(table(test$Species, p)))/length(test$Species)

importance(modelo)
varlmpPlot(modelo,sort= T, main = "Importancia")

a= data.frame(Sepal.Length = 4.8, Sepal.Width=3,Petal.Length=1.5,Petal.Width=0.3)
predict(modelo, a)