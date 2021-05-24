class Deliver < ApplicationRecord
  extend Enumerize
  belongs_to :request

  enumerize :status, in: {
    pending: 0,
    handling: 1,
    finish: 2,
  }, predicates: true

  validates :status, :reason, presence: true

  def self.search(term)
    if term
      where('status LIKE ?', "%#{term}%")
    else
      all
    end
  end

end
