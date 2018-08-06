class Item < ApplicationRecord
  enum source: { youla: 'youla', avito: 'avito' }
  validates :source, inclusion: { in: sources.keys, message: :invalid }
  validates :product_id, presence: true
  belongs_to :search
  has_many :prices

# Return all items for given search with actual item.price
  scope :with_actual_price, (
    lambda do |search_id|
      where(search_id: search_id)
        .select('DISTINCT ON (items.product_id)
                  items.id,
                  items.product_id,
                  items.source,
                  items.title,
                  items.url,
                  prices.value AS price,
                  prices.created_at AS price_date')
        .joins(:prices)
        .order('items.product_id, prices.created_at ASC')
    end
  )
end
