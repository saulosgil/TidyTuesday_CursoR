# Carregando pacotes

library(ggplot2)

# lendo a base diretamente do site

olympics <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-27/olympics.csv')

# Todas medalhas conquistadas pelo Brasil ---------------------------------

# esportes individuais

medals_individuals <-
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
  dplyr::mutate(sex = dplyr::case_when(sex == "F" ~ "Mulheres",
                                       sex == "M" ~ "Homens")
)

# Grafico das medalhas em esportes individuais

medals_individuals_plot <-
  medals_individuals |>
  ggplot(aes(x = medal, fill = medal)) +
  geom_bar() +
  labs(title = "Total de medalhas do Brasil em esportes indivíduais",
       subtitle = "entre os anos de 1896 até 2016") +
  xlab("") +
  ylab("") +
  ggthemes::theme_economist_white() +
  theme(plot.title = element_text(face = "bold",
                                  hjust = 0.5,
                                  size = 25),
        plot.subtitle = element_text(face = "bold",
                                     hjust = 0.5,
                                     size = 18),
        axis.text.y = element_text(size = 12,
                                   face = "bold"),
        axis.title.x = element_blank(),
        axis.text.x.bottom = element_blank(),
        axis.ticks.x = element_blank(),
        legend.title = element_text(colour = "white"),
        legend.position = "top") +
  scale_fill_manual(values = c("#9e6003",
                               "#d1af02",
                               "#91918e"))

medals_individuals_plot

# Grafico do número de medalhas por sexo ----------------------------------

plotly::ggplotly(medals_individuals |>
  ggplot(aes(x = medal, fill = medal)) +
  geom_bar() +
  labs(title = "Homens",
       caption = "Fonte: https://www.kaggle.com"
  ) +
  xlab("") +
  ylab("") +
  ggthemes::theme_economist_white() +
  theme(plot.title = element_text(face = "bold",
                                  hjust = 0.5,
                                  size = 25),
        axis.text.y = element_text(size = 12,
                                   face = "bold"),
        axis.title.x = element_blank(),
        axis.text.x.bottom = element_blank(),
        axis.ticks.x = element_blank(),
        legend.title = element_text(colour = "white"),
        legend.position = "top") +
  scale_fill_manual(values = c("#9e6003",
                               "#d1af02",
                               "#91918e")) +
  coord_flip() +
  facet_wrap("sex", scales = "fixed")
  )


