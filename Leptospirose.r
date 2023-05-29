pacman::p_load(
  flexdashboard,
  tidyverse,
  dygraphs,
  stringi,
  xts,
  rio,
  lubridate,
  here,
  stringr,
  Matrix,
  thematic,
  foreign,
  fs, 
  sf,
  epikit,
  shiny,
  plotly,
  geobr,
  DT,
  viridis) 

# Dados ----

lepto <- import("LEPTONET.DBF")


# Recode ----

# classificação final 
lepto <- lepto %>% 
  mutate(classificacao = recode(CLASSI_FIN,
                                "1" = "Confirmado",
                                "2" = "Descartado"))

lepto <- lepto %>% 
  mutate(classificacao = replace_na(classificacao, "Suspeito"))


# Criando a variável de idade a partir da data de nascimento
lepto$idade <- as.numeric((lepto$DT_SIN_PRI - lepto$DT_NASC) /365)


# Faixa etária ----
lepto <- lepto %>% 
  mutate(faixa_etaria = age_categories(idade, 
                                       lower=0, 
                                       upper=60, 
                                       by=10))


# Semana epiemiológica ----


lepto <- lepto %>% 
  mutate(epi_semana = floor_date(DT_SIN_PRI, unit= "week"),
         Ano = floor_date(DT_SIN_PRI, unit = "year"),
         ano = substr(Ano, 1, 4),
         DT_SIN_PRI = as.Date(DT_SIN_PRI))



# Evolução ----
lepto <- lepto %>% 
  mutate(evolucao = recode(EVOLUCAO,
                           "1" = "Cura",
                           "2" = "Óbito por leptospirose",
                           "3" = "Óbito por outras causas",
                           "9" = "ignorado"))


# Raca ----
lepto <- lepto %>% 
  mutate(raca_cat = recode(CS_RACA,
                           # for reference: OLD = NEW
                           "1" = "Branca",
                           "2" = "Preta",
                           "3" = "Amarela",
                           "4" = "Parda",
                           "5" = "Indígena",
                           "9" = "Ignorado"))

# Sexo ----
lepto <- lepto |> 
  mutate(CS_SEXO = replace(CS_SEXO, CS_SEXO== "I",NA))                                    


lepto <- lepto %>% 
  mutate(sexo = recode(CS_SEXO,
                       # for reference: OLD = NEW
                       "F" = "Feminino",
                       "M" = "Masculino"))


# Escolaridade ----
lepto <- lepto %>% 
  mutate(escola = recode(CS_ESCOL_N,
                         # for reference: OLD = NEW
                         "00" = "Analfabeto",
                         "01" = "1 a  4 série incompleta",
                         "02" = "Até a 4 série completa",
                         "03" = "4 a 8 série incompleta",
                         "04" = "Ensino fundamental completo",
                         "05" = "Ensino Médio incompleto",
                         "06" = "Ensino Médio completo",
                         "07" = "EnsinoSuperior incompleto",
                         "08" = "Ensino Superior completo",
                         "09" = "Ignorado",
                         "10" = "Nao se aplica"))

## Gestante ----

lepto <- lepto %>% 
  mutate(gestante = recode(CS_GESTANT,
                           # for reference: OLD = NEW
                           "1" = "1 trimestre",
                           "2" = "2 trimestre",
                           "3" = "3 trimestre",
                           "4" = "Idade gestacional ignorada",
                           "5" = "Não",
                           "6" = "Não se aplica",
                           "9" = "Ignorado"))


## Hospitalização ----

lepto <- lepto %>% 
  mutate(hospital = recode(ATE_HOSP,
                           # for reference: OLD = NEW
                           "1" = "Sim",
                           "2" = "Nao",
                           "9" = "ignorado"))
