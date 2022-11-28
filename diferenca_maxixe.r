#install.packages("WDI")
library(tidyverse)
#trat 1 = 10% adubo 90% terra
#trat 3 = 25% adubo 75% terra
#trat 4 = 50% adubo 50% terra
dados <- read.csv("dadosexp - placa_maxixe.csv")

summary(dados)

dados$trat <- factor(dados$trat)

boxplot(dados$alt_aprox~dados$trat,main="Crescimento do Maxixe Por Tratamento",ylab="Altura (cm)",xlab="Tratamento")

boxplot(dados$folhas~dados$trat,main="Crescimento de folhas Maxixe Por Tratamento",ylab="N de Folhas",xlab="Tratamento")

kruskal.test(dados$alt_aprox~dados$trat)

kruskal.test(dados$folhas~dados$trat)

pairwise.wilcox.test(dados$alt_aprox, g = dados$trat, p.adjust.method = "bonferroni")

pairwise.wilcox.test(dados$folhas, g = dados$trat, p.adjust.method = "bonferroni")
