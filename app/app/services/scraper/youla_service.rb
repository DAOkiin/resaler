module Scraper
  class YoulaService < Base
    def initialize(params)
      super
    end

    private

    def construct_query(text)
      URI.encode('https://youla.ru/moskva?q=' + text.to_s)
    end

    def parse_data_from_page(page)
      result = {}
      page.css('.product_item').each do |item|
        result[item['data-id']] =
          {
            item_data: {
              source: :youla,
              product_id:  item['data-id'],
              title:    item.xpath('.//*[@class="product_item__title"]')
                            .text.strip,
              url:      'https://youla.io' + item.xpath('./a')
                                                 .attribute('href').value,
            },
            price:      item.xpath('.//*[@class="product_item__description"]')
                            .text.tr('^0-9', '')
          }
      end

      result
    end
  end
end
