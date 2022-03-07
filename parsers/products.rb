html = Nokogiri.HTML(content)

bl = {}

bl["product_name"] = html.css(".c-main-product__title.u-txt--large").text

bl["url"] = page["url"]

base_price = html.css(".c-product-price.-original.-main").text

rec_price = html.css(".c-product-price.-discounted.-main").text
bl["recent_price"] = rec_price != "" ? rec_price : base_price

bl["base_price"] = base_price ? base_price : rec_price

bl["is_has_discount"] = rec_price != "" ? true : false

cond = html.css(".c-product-details-section__main div.c-label").text
bl["condition"] = cond

bl["category"] = html.css(".c-bl-breadcrumb__item-text.u-fg-hover--red-brand").text
bl["specifications"] = html.css(".c-information__table tr").text

bl["description"] = html.css(".c-information__description-txt").text

reting = html.css(".summary__score").text
bl["ratings"] = reting ? reting : 0

feedbacks = html.css(".c-main-product__rating.u-mrgn-right--2").text.gsub(" Ulasan","")
bl["number_of_feedbacks"] = feedbacks ? feedbacks : "-"

bl["_collection"] = "products"

outputs << bl