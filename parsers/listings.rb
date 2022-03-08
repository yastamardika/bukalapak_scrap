html = Nokogiri.HTML(content)

product_list = html.css(".bl-flex-item.mb-8")

product_list.each do |product|
    href = product.css('a.slide > @href').text
    # p href
    pages << {
        url: href,
        method: "GET",
        page_type: "products",
        headers: {"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"},
        vars: {
          category: "Roadbike"
        },
        fetch_type: "browser" 
    }
end

# max_page = html.css('ul.bl-ghostblock-pagination__list li.has-page-active span[aria-current="true"]')
# p max_page
page_num = page["vars"]["page_num"]
url = "https://www.bukalapak.com/c/sepeda/fullbike/roadbike?page#{page_num}"
page_num += 1
# p pagination_links
if page_num <= page["vars"]["max_page"]
    pages << {
        url: url,
        page_type: 'listings',
        method: "GET",
        headers: {"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"},
        vars: {
            category: "Roadbike",
            page_num: page_num,
            max_page: 99
          },
        fetch_type: "browser"
        }
end

