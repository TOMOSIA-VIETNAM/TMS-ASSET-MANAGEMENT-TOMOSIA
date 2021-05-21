class Request < ApplicationRecord
  extend Enumerize
  
  belongs_to :user
  belongs_to :item

  enumerize :status, :in => {
    pending: 0,
    approve: 1,
    reject: 2
  }
  validates :reason, :start_date, :end_date, presence: true

  # validates :type_request, :reason, :start_date, :end_date, :presence => true

end
