# Rlnno try to share shiny app :

# install.packages("remotes")
require(devtools)
install_github("ficonsulting/RInno")
# install.packages("RInno")
require(remotes)
require(RInno)

# RInno setup :

setwd("C:/sanjay/projects/TE/2020/GSP/language_detection/shinyapp/language_detection")

install_inno()

create_app(app_name =  "language_detection", app_dir = "app",
           user_browser = "chrome", R_version = "3.6.0")
compile_iss()