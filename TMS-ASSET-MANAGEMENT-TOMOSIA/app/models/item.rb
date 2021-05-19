class Item < ApplicationRecord
  has_many :providers
  # belongs_to :category
end
