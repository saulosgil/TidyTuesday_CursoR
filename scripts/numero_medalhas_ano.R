# Carregando pacotes

library(ggplot2)

# lendo a base diretamente do site

olympics <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-27/olympics.csv')

# Agrupando a base por ano

medal_year <-
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
  dplyr::group_by(year) |>
  dplyr::count(medal)

# Figura 2

plotly::ggplotly(medal_year |>
  dplyr::select(year, medal, n) |>
  ggplot(aes(x = year, y = n, fill = medal)) +
  geom_col() +
  labs(title = "Número total de medalhas do Brasil por ano (1896-2016)") +
  xlab("Anos") +
  ylab("") +
  ggthemes::theme_economist_white() +
  theme(plot.title = element_text(face = "bold",
                                  hjust = 0.5,
                                  size = 20),
        plot.subtitle = element_text(face = "bold",
                                     size = 20,
                                     hjust = 0.5),
        axis.text.y = element_text(size = 12,
                                   face = "bold"),
        legend.title = element_text(colour = "white"),
        legend.position = "top") +
  scale_x_continuous(n.breaks = 10) +
  scale_fill_manual(values = c("#9e6003",
                               "#d1af02",
                               "#91918e")
                    )
)



