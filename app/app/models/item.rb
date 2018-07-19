class Item < ApplicationRecord
  belongs_to :search
  has_many :prices
end
