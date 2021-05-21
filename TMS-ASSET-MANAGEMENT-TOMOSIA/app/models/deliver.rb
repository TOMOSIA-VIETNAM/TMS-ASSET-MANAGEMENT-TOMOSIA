class Deliver < ApplicationRecord
  extend Enumerize

  belongs_to :request

  enumerize :status, in: {
    pending: 0,
    handling: 2,
    finish: 3,
  }, predicates: true
end
