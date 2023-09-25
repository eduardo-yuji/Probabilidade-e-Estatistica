#P1
#Deivid da silva galvao

#Questão 1
#lendo arquivo csv
# arq deve estar na mesma pasta
# abrir bloco de notas para verificar a sepercao dos dados
dados=read.csv('dados1.csv', sep = ',',dec='.',header = T)

install.packages("ggplot2")
# Carregando a biblioteca ggplot2
library(ggplot2)

# Criando o gráfico de barras agrupadas
ggplot(dados, aes(x = fabricante, y = resistencia, fill = tamanho)) + 
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(x = "Fabricante", y = "Quantidade", fill = "Tamanho") +
  theme_dark() +  scale_fill_brewer(palette = "Dark2")

ggplot(dados,aes(x =fabricante,fill=tamanho)) +geom_bar()+
  labs(x = "Fabricante", y = "Quantidade", fill = "Tamanho") +
  scale_fill_brewer(palette="Set6")+theme_dark()

#Questão 2

# Carregando a biblioteca ggplot2
library(ggplot2)

# Criando o gráfico de boxplot
ggplot(dados, aes(x = fabricante, y = resistencia, fill = tamanho)) + 
  geom_boxplot() +labs(x = "Fabricante", y = "Resistência", fill = "Tamanho") +
  theme_dark() +  scale_fill_brewer(palette = "Paired")

# Questão 3

# Calculando as médias das resistências por fabricante e tamanho
medias <- aggregate(resistencia ~ fabricante + tamanho, data = dados, mean)

# Criando o gráfico de barras agrupadas
ggplot(medias, aes(x = fabricante, y = resistencia, fill = tamanho)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(x = "Fabricante", y = "Média de Resistência", fill = "Tamanho") +
  theme_get()  + scale_fill_brewer(palette = "Paired")


#Questão 4
# Criando o gráfico de dispersão
ggplot(dados, aes(x = tempo, y = peso, color = tamanho)) +
  geom_point() +
  facet_wrap(~ tamanho) +
  labs(x = "Tempo", y = "Peso", color = "Tamanho") +
  theme_dark()

#Questão 5
# Criando o gráfico de violino
ggplot(dados, aes(x = fabricante, y = resistencia, fill = fabricante)) +
  geom_violin() +
  labs(x = "Fabricante", y = "Resistência", fill = "Fabricante") +
  theme_light() + 
scale_fill_brewer(palette = "Paired")
