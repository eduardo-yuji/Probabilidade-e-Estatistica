#21/03
# Base de dados

# -- Vetores --

idade=c(18,20,23,25)
sexo=c("M", "F", "F", "M")

(dados= data.frame(idade,sexo))
dados

#lendo arquivo csv
# arq deve estar na mesma pasta
# abrir bloco de notas para verificar a sepercao dos dados

dados=read.csv('dados1.csv', sep = ',',dec='.',header = T)

#lemdo arquivo 2
dados2=read.csv('dados2.csv', sep=',', dec='.',header = T)

#para acessar um vetor da base de dados
dados2$aluno

#criar uma nova variavel dentro de uma base de dados 
dados2$classe=c('a','b', 'a', 'b')

#informaçoes dos dados
dados2$variavel
dim(dados2)
names(dados2)
head(dados2, 2)


#dados2[LINHA,COLUNA]
# mostrar dados de determinadas "coordenadas"
dados2[1,1]
dados2[1,3]
dados2[4,1]
dados2[,1]
dados2[1,]

dados2[4,4]='c'

#condição
ifelse(dados2$aluno<=3, 'jovem', 'tmj')
#salvar o retorno do if else na variavel condicao da base de dados2
dados2$condicao=(ifelse(dados2$aluno<=3, 'jovem', 'tmj'))

#lemdo arquivo 3
dados3=read.csv('dados3.csv', sep=',', dec='.',header = T)

#criando funcao que calcula o imc
calc_imc= function(x, a){
  imc = x/(a*a)
  return (imc)
}
imc=apply(dados3, 1, function(x) calc_imc(x[1],x[3]))(dados3$peso,dados3$altura)

dados3$imc <- imc
dados3$condicao=(ifelse(dados3$imc>=19, 'normal', 'baixo'))
