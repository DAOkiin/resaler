module DataSupport
  def parsed_items(count: 1, source: :youla, init_id: 1)
    result = {}
    count.times do |i|
      product_id = "product_#{i + init_id.to_i}"
      result[product_id] = {
        item_data: {
          title: "title_#{i + init_id.to_i}",
          url: 'support_url',
          product_id: product_id,
          source: source
        },
        price: 42
      }
    end
    result
  end
  module_function :parsed_items
end
