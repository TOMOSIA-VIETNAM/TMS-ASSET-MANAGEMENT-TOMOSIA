class Item < ApplicationRecord
  extend Enumerize

  has_one :request

  enumerize :status, in: {
    stock: 0,
    broken: 1,
    out_stock: 2,
  }, predicates: true

  scope :items_broken, -> {where status: 'broken'}
  scope :items_stock, -> {where status: 'stock'}
  scope :items_out_stock, -> {where status: 'out_stock'}

  def self.search(option)
    case option
    when option
      where('name LIKE ?', "%#{option}%")
    when option
      where('name LIKE ?', "%#{option}%")
    else
      all
    end
  end
end
