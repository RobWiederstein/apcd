#download statuory enactments from apcd council
#only downloaded 12 out of 20
#download April 19, 2019


library(rvest)
url <- "https://www.apcdcouncil.org/apcd-legislation-state"
tag <- "#block-system-main a"
#read webpage
webpage <- read_html(url)
#get links
links <- webpage %>% html_nodes(tag) %>% html_attr("href")
names <- webpage %>% html_nodes(tag) %>% html_text(trim = T)
#build destfiles
names <- gsub(" ", "_", names)
names <- tolower(names)
names <- paste(names, ".pdf", sep = "")
destfile <- paste("./enactments/", names, sep = "")
#download files to folder "enactments"
for(i in 1:length(links)){
        download.file(url = links[i], destfile = destfile[i])
}

