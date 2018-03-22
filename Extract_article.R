library(XML)
library(RCurl)

#install.packages("rvest")
library(rvest)

webpage = readLines("https://en.wikipedia.org/wiki/Om_Prakash_(general)")
webpage2 = curl_fetch_memory("https://en.wikipedia.org/wiki/Om_Prakash_(general)")

relevant_lines = webpage[grep("<p>",webpage)]
total_paragraphs = length(relevant_lines)

final_textlist = c()
title_list= C()

for(i in 1:total_paragraphs){
  fetchedline = gsub(pattern = '<a href=(.*)</a>',x=as.character(relevant_lines[i]),replacement = "",ignore.case = TRUE)
  fetchedline = gsub(pattern = 'class=(.*)>',x=as.character(relevant_lines[i]),replacement = "",ignore.case = TRUE)

  final_textlist = c(final_textlist,fetchedline)
  }


final_textlist

