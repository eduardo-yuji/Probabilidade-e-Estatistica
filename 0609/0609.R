install.packages("gapminder")
install.packages("ggplot2")
install.packages("gifski")
install.packages("png")
install.packages("gapminder")

####animado dispersao####
library(gapminder)
library(ggplot2)
library(gifski)
library(gganimate)
library(png)
head(gapminder)

#relação entre renda x espectativa de vida
ggplot(gapminder, aes(gdpPercap, lifeExp))+geom_point()+theme_bw()

#colorir por continente
ggplot(gapminder, aes(gdpPercap, lifeExp, col = continent))+geom_point()+theme_bw()

#tamanho do ponto de acordo com a população
ggplot(gapminder, aes(gdpPercap, lifeExp, col = continent, size = pop))+geom_point()+theme_bw()

#arrumar nome dos eixos
ggplot(gapminder, aes(gdpPercap, lifeExp, col = continent, size = pop))+geom_point()+theme_bw() 
+labs(title = "ano:{frame_time}", x = "Renda per capita", y = "Espectativa de vida")

#animar 
grafico = ggplot(gapminder, aes(gdpPercap, lifeExp, col = continent, size = pop))+geom_point()+theme_bw() 
+labs(title = "ano:{frame_time}", x = "Renda per capita", y = "Espectativa de vida") + transition_time(year)

animate(grafico,renderer = gifski_renderer())

