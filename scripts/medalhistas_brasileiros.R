# Carregando pacotes

library(ggplot2)

# lendo a base diretamente do site

olympics <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-27/olympics.csv')

# Filtrando a base com apenas os medalhistas

medalhistas <-
  olympics |>
  dplyr::filter(team == "Brazil",
                season == "Summer",
                !sport == "Football",
                !sport == "Basketball",
                !sport == "Volleyball",
                !event == "Athletics Men's 4 x 100 metres Relay",
                !event == "Canoeing Men's Canadian Doubles, 1,000 metres",
                !event == "Sailing Men's Two Person Keelboat",
                !event == "Sailing Mixed Multihull",
                !event == "Sailing Mixed Three Person Keelboat",
                !event == "Sailing Mixed Two Person Heavyweight Dinghy",
                !event == "Sailing Mixed Two Person Keelboat",
                !event == "Swimming Men's 4 x 100 metres Freestyle Relay",
                !event == "Swimming Men's 4 x 200 metres Freestyle Relay",
                !event == "Swimming Men's 400 metres Individual Medley",
                !event == "Equestrianism Mixed Jumping, Team",
                !is.na(medal)) |>
  dplyr::select(name)

# criando um freqtable

medalhistas <- janitor::tabyl(medalhistas$name)


# Plot maiores medalhistas

medalhistas |>
  ggplot(aes(x = forcats::fct_reorder(`medalhistas$name`, n, .desc = TRUE),
             y = n,
             fill = `medalhistas$name`)) +
  geom_col(show.legend = FALSE) +
  labs(title = "Maiores medalhistas brasileiros",
       caption = "Fonte: https://www.kaggle.com") +
  coord_flip() +
  xlab("") +
  ylab("") +
  ggthemes::theme_economist_white() +
  theme(plot.title = element_text(face = "bold",
                                  hjust = 0.5,
                                  size = 25),
        axis.text.y = element_text(size = 8,
                                   face = "bold"),
        axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        legend.title = element_text(colour = "white"),
        legend.position = "top") +
  coord_flip()



