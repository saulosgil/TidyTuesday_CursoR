# Carregando pacotes

library(ggplot2)

# lendo a base diretamente do site

olympics <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-27/olympics.csv')

# Agrupando a base por ano

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
  dplyr::arrange(year) |>
  dplyr::select(name, age, year, city, sport, event, medal) |>
  DT::datatable(rownames = FALSE,
                colnames = c("Nome do atleta",
                             "Idade",
                             "Ano",
                             "Cidade",
                             "Esporte",
                             "Prova",
                             "Medalha"),
                caption = "Tabela 1. Medalhistas brasileiros por ano",)



