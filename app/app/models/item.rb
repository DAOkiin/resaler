class Item < ApplicationRecord
  enum source: { youla: 'youla', avito: 'avito' }
  validates :source, inclusion: { in: sources.keys, message: :invalid }
  belongs_to :search
  has_many :prices
end
