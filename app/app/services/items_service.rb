class ItemsService
  class InvalidItem < StandardError; end
  attr_reader :search_id, :data

  def self.call(search_id:, data:)
    new(search_id, data).call
  end

  def initialize(search_id, data)
    @search_id = search_id
    @data = data
    @existed_product_ids = Item.where(product_id: @data.keys).map(&:product_id)
  end

  def call
    update_existed_items
    create_new_items
  end

  private

  def update_existed_items
    @data.slice(*@existed_product_ids).each do |product_id, payload|
      item = Item.find_by(product_id: product_id)
      item.update_attributes(@data[product_id][:item_data])
      item.prices.create! value: payload[:price]
    end
  end

  def create_new_items
    @data.except(*@existed_product_ids).each_value do |payload|
      item = Item.create!(payload[:item_data].merge!(search_id: @search_id))
      item.prices.create! value: payload[:price]
    end
  end
end
