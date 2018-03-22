library(XML)
library(RCurl)

#install.packages("rvest")
library(rvest)

#Getting the html page from the Given URL
htmlpage= read_html("https://en.wikipedia.org/wiki/Om_Prakash_(general)")

#Get all the paragraph nodes in the html
paragraph_results = htmlpage %>% html_nodes("p")
paragraph_results

num_paragraphs = length(paragraph_results)

#Create an empty list to store all paragraph texts
paragraph_text_list = c()

#Looping through all the paragraph results to extract their text
for(i in 1:num_paragraphs){
  para_text = paragraph_results[i] %>% html_text(trim=TRUE)

  paragraph_text_list = c(paragraph_text_list,para_text)
}

paragraph_text_list

#Create an empty list for storing headings
heading_list = c()

#Extracting all the heading texts
for(i in 1:6){
  heading = htmlpage %>% html_nodes(paste0("h",i)) %>% html_text(trim=TRUE)
  heading_list = c(heading_list,heading)
}

heading_list
