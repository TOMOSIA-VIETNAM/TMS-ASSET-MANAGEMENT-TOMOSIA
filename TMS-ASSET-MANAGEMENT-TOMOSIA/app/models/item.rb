class Item < ApplicationRecord
  extend Enumerize
  has_one :request
  serialize :detail, JSON

  DETAIL_ATTRIBUTES = %i(CPU RAM Screen	Graphics HardDrive Dimensions year)

  validates :name, :status, :price, :detail, presence: true

  enumerize :status, in: {
    stock: 0,
    broken: 1,
    out_stock: 2,
  }, predicates: true

  scope :status_stock, -> {where status: 'stock'}
  scope :status_broken, -> {where status: 'broken'}

  def self.search(option)
    if option[:search_stock]
      where('name LIKE ?', "%#{option[:search_stock]}%")
    elsif option[:search_broken]
      where('name LIKE ?', "%#{option[:search_broken]}%")
    else
      all
    end
  end
end
