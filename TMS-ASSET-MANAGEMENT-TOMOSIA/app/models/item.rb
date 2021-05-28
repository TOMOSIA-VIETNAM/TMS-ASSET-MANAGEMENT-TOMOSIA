class Item < ApplicationRecord
  extend Enumerize
  has_one :request
  has_one :user, through: :request
  serialize :detail, JSON

  DETAIL_ATTRIBUTES = %i(CPU RAM Screen	Graphics HardDrive Dimensions year)
  CSV_ATTRIBUTES = %w(name status comment price detail).freeze

  validates :name, :status, :price, :detail, presence: true

  enumerize :status, in: {
    stock: 0,
    broken: 1,
    out_stock: 2,
  }, predicates: true

  scope :items_broken, -> {where status: 'broken'}
  scope :items_stock, -> {where status: 'stock'}
  scope :items_out_stock, -> {where status: 'out_stock'}

  # scope :by_user, -> (user){joins(request: :user).where(user:{id: user.id}) }
  
  # Item.joins(request: :user).where(user:{id: @user.id})

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
