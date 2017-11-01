library(httr)

cURL = "https://graph.facebook.com/v2.10/kikuChen/?fields=posts.limit(10)&access_token=EAACEdEose0cBAKvpRgHQJ0XWkZCYU55mImMXtPZBfFuGYg38CZBDThGqHkvoZCej8xfuwx5qU0VW9jb5UTejGQoZB3iD5OBWt4VVLLlvWyZCsPc7Jr1a98ZCZC0eNj7IX7C38vKYQo838YU7zYtmyxP8tXZAjfKtUyBmHdj1mn7tU5WsMHpaDBh92L7j3ZAXruXygZD"
res = GET(cURL)
post = content(res)