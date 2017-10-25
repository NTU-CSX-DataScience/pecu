library(httr)
library(XML)
library(rvest)
library(tmcn)

Myurl= "https://buy.yungching.com.tw/region/"
Userhead = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
res = GET(url=Myurl, add_headers("user-agent" = Userhead))
getResult = content(res, "text")
doc = read_html(getResult)
name = html_nodes(doc, '.item-description')
nametext = toUTF8(html_text(name))
price = html_nodes(doc, '.price-num')
pricetext = toUTF8(html_text(price))

result = data.frame(nametext, pricetext)
