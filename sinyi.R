library(httr)
library(XML)
library(tmcn)
library(rvest)

cityNames = c('Nantou-county','Taipei-city','Taichung-city')
Myurl= "http://buy.sinyi.com.tw/list/"
Userhead = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
allData = data.frame()

for( cid in c(1:3) )
{
  print(cityNames[cid])
  for( i in c(1:2))
  {
    print(paste0("page",i))
    if(i == 1)
    {
      res = GET(paste0(Myurl,cityNames[cid],"/index.html"), add_headers("user-agent" = Userhead))
    }
    else
    {
      res = GET(paste0(Myurl,cityNames[cid],"/",i,".html"), add_headers("user-agent" = Userhead))
    }
    doc = content(res, "text")
    dochtml = read_html(doc)
    
    insideID = html_attr(html_nodes(dochtml, 'div.search_result_item'), "id")
    insideURL = substr(insideID, 15, 20)

    title = html_nodes(dochtml, 'span.item_title')
    titletext = toUTF8(html_attr(title, "title"))
    price = html_nodes(dochtml, '.price_new')
    pricetext = toUTF8(html_text(price))
    contentData = html_nodes(dochtml, 'div.item_detailbox')
    contentText = toUTF8(html_text(contentData))
    tempDataframe = data.frame(titletext, pricetext, contentText, insideURL)
    allData = rbind(allData, tempDataframe)
  }
}

nextURL = "http://buy.sinyi.com.tw/house/"
allID = length(allData[,1])
for( y in c(1:allID) )
{
  subURL = paste0(nextURL,allData[y,4],".html")
  print(subURL)
  res = read_html(subURL)
  houseInfo = html_node(res, '.house_info')
  houseText = toUTF8(html_text(houseInfo))
}