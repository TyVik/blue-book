Скрапинг и переход на следующую страницу:

```python
def parse(self, response):  
    products = response.css('product-item')  
    for product in products:  
        #here we put the data returned into the format we want to output for our csv or json file  
        yield{  
            'name' : product.css('a.product-item-meta__title::text').get(),  
            'price' : product.css('span.price').get().replace('<span class="price">\n <span class="visually-hidden">Sale price</span>','').replace('</span>',''),  
            'url' : product.css('div.product-item-meta a').attrib['href'],  
        }  
  
    next_page = response.css('[rel="next"] ::attr(href)').get()  
  
    if next_page is not None:  
        next_page_url = 'https://www.chocolate.co.uk' + next_page  
        yield response.follow(next_page_url, callback=self.parse)
```

## Прокси

- [Scrapoxy](https://scrapoxy.io/) - Scrapoxy is a super proxy aggregator, allowing you to manage all proxies in one place 🎯, rather than spreading it across multiple scrapers 🕸️. 
- [proxy pool](https://github.com/rejoiceinhope/scrapy-proxy-pool/blob/master/scrapy_proxy_pool/middlewares.py)
- [Scrapy Beginners Series Part 4: User Agents and Proxies](https://scrapeops.io/python-scrapy-playbook/scrapy-beginners-guide-user-agents-proxies/) - базовая работа с проксями

