# github

# 1.instalar no pc o software
# 2.ter o pacote usethis instalado

#install.packages(usethis)

# 3.se apresentar pro git

usethis::use_git_config(user.name="Bianca",
                        user.email= "bittenka@gmail.com")

# colocar o email cadastrado no git

# 4. criar o PAT - persoal token - senha

# serve pra fazer a autenticacao no github, pra provar que é a gente usando.
# esse token precisa ser gerado a cada 30 dias
# pode criar varios


usethis::create_github_token()

# cria o toke e copia e cola aqui 

ghp_BLALALLALA

# para salvar a senha 
gitcreds::gitcreds_set()

#segue os passos do console e cola o token

# reiniciar o rstudio

# situacao - serve pra verificar

usethis::git_sitrep() 

# ao rodar a funcao a cima precisa aparecer
# as seguintes infos no console, pra ter
#certeza que ta configurado e funcionado

# Git config (global)
# • Name: 'Bianca'
# • Email: 'bittenka@gmail.com'
# Personal access token for 'https://github.com': '<discovered>'


## terminou a configuracao



# Agora inicia o compartilhamento do projeto pro repositorio
# usar sempre  os dois comando em cada novo projeto

usethis::use_git()


# vai aparecer os arquivos que nao foram
# "comitados" como abaixo

# There are 14 uncommitted files:
#   * '.gitignore'
# * 'areas_ia.jpg.gif'
# * 'curso-r-cievs.Rproj'
# * 'github.R'
# * 'instalacoes_pre_curso_files/'
# * 'instalacoes_pre_curso.html'
# * 'instalacoes_pre_curso.qmd'
# * 'Introducao-ao-curso_files/'
# * 'Introducao-ao-curso.html'
# * 'Introducao-ao-curso.qmd'

#pode inserir que nao quer comitar agora

# depois aceita reiniciar o R 
# vai aparece o git no enviroment 

usethis::use_github()

# O comando acima sincroniza a pasta com o GitHub.


