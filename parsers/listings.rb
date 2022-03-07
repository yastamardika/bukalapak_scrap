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

pagination_links = html.css('ul.bl-ghostblock-pagination__list li a')
# p pagination_links
pagination_links.each do |link|
    new_url = link["href"]
    url = "https://www.bukalapak.com/c/sepeda/fullbike/roadbike#{link["href"]}"
    pages << {
        url: url,
        page_type: 'listings',
        fetch_type: 'browser',
        vars: {}
        }
end